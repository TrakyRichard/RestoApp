import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commons/commons.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart' as image_picker;
import 'package:image_picker/image_picker.dart';

import '../dishes.dart';

part 'edit_dish_event.dart';
part 'edit_dish_state.dart';

class EditDishBloc extends Bloc<EditDishEvent, EditDishState> {
  EditDishBloc() : super(initDishState) {
    on<EditDishEvent>((event, emit) {
      if (event is EditDishNameEvent) {
        emit(state.copyWith(name: event.name));
      } else if (event is EditDishDescriptionEvent) {
        emit(state.copyWith(description: event.description));
      } else if (event is EditDishPriceEvent) {
        emit(state.copyWith(price: event.price));
      } else if (event is EditDishCategoryEvent) {
        emit(state.copyWith(category: event.category));
      } else if (event is EditDishLabelEvent) {
        emit(state.copyWith(label: event.label));
      } else if (event is EditDishFeaturedEvent) {
        emit(state.copyWith(featured: event.featured));
      } else if (event is EditDishStartTimeOfAvailabilityEvent) {
        emit(state.copyWith(
            startTimeOfAvailability: event.startTimeOfAvailability));
      } else if (event is EditDishEndTimeOfAvailabilityEvent) {
        emit(
            state.copyWith(endTimeOfAvailability: event.endTimeOfAvailability));
      } else if (event is EditDishTimeToWaitEvent) {
        emit(state.copyWith(timeToWait: event.timeToWait));
      } else if (event is EditDishIsAvailableEvent) {
        emit(state.copyWith(isAvailable: event.isAvailable));
      } else if (event is EditDishIsFeaturedEvent) {
        emit(state.copyWith(featured: event.isFeatured));
      } else if (event is EditDishResetEvent) {
        emit(initDishState);
      }
    });
    on<EditDishImagesEvent>((event, emit) {
      emit(state.copyWith(images: event.images));
    });
    on<EditDishIngredientsEvent>((event, emit) {
      emit(state.copyWith(ingredients: event.ingredients));
    });
    on<RemoveDishIngredientEvent>(_removeIngredient);
    on<AddDishIngredientsEvent>(_addIngredient);
    on<InitEditDishEvent>(_initEditDish);
    on<AddImagesEvent>(_addImages);
    on<EditDishSaveEvent>(_saveDish);
    on<EditDishIngredientEvent>(_editIngredient);
  }

  FutureOr<void> _removeIngredient(
      RemoveDishIngredientEvent event, Emitter<EditDishState> emit) {
    final ingredients = [...state.ingredients];
    ingredients.removeAt(event.index);
    emit(state.copyWith(ingredients: ingredients));
  }

  FutureOr<void> _initEditDish(
      InitEditDishEvent event, Emitter<EditDishState> emit) {
    emit(state.copyWith(
        id: event.dish.id,
        name: event.dish.name,
        description: event.dish.description,
        imageUrls: event.dish.images,
        ingredients: event.dish.ingredients,
        price: event.dish.price,
        category: event.dish.category,
        label: event.dish.label,
        featured: event.dish.featured,
        startTimeOfAvailability: event.dish.startTimeOfAvailability,
        endTimeOfAvailability: event.dish.endTimeOfAvailability,
        timeToWait: event.dish.timeToWait,
        isAvailable: event.dish.isAvailable));
  }

  FutureOr<void> _addIngredient(
      AddDishIngredientsEvent event, Emitter<EditDishState> emit) {
    final ingredients = [...state.ingredients];
    ingredients.add(event.ingredient);
    emit(state.copyWith(ingredients: ingredients));
  }

  FutureOr<void> _addImages(
      AddImagesEvent event, Emitter<EditDishState> emit) async {
    List<image_picker.XFile>? images =
        await image_picker.ImagePicker().pickMultiImage();
    if (images.isNotEmpty) {
      emit(state.copyWith(images: images));
    }
  }

  Future<FutureOr<void>> _saveDish(
      EditDishSaveEvent event, Emitter<EditDishState> emit) async {
    await uploadFiles(state.images).then((value) {
      emit(state.copyWith(imageUrls: value));
    });
  }

  FutureOr<void> _editIngredient(
      EditDishIngredientEvent event, Emitter<EditDishState> emit) {
    emit(state.copyWith(ingredient: event.ingredient));
  }
}
