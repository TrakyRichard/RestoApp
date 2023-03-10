import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:restaurant/locator.dart';

import '../dishes.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  final DishRepository dishRepository = locator<DishRepository>();
  DishBloc()
      : super(DishState(
            dishes: const [],
            isLoading: false,
            error: "",
            isSuccess: false,
            category: CategoryEnum.mainCourse,
            dish: initDishModel)) {
    on<DishEvent>((event, emit) {});
    on<LoadDishesEvent>(_loadDishes);
    on<AddDishEvent>(_addDish);
    on<UpdateDishEvent>(_updateDish);
    on<LoadDishByIdEvent>(_loadDishById);
    on<DeleteDishEvent>(_deleteDish);
    on<SearchDishEvent>(_searchDish);
    on<FilterDishEvent>(_filterDishByCategory);
    on<SortDishEvent>(_sortDish);
    on<ChangeCategoryEvent>(_changeCategory);
    on<LoadDishesByCategoryEvent>(_loadDishesByCategory);
  }

  FutureOr<void> _loadDishes(
      LoadDishesEvent event, Emitter<DishState> emit) async {
    emit(state.copyWith(isLoading: true));
    await dishRepository.getDishes().then((value) {
      final List<DishModel> response = List.from(value);
      emit(state.copyWith(dishes: response, isLoading: false));
    }).catchError((err) {
      emit(state.copyWith(
          error: err.toString(), isLoading: false, isSuccess: false));
    });
    ;
  }

  FutureOr<void> _addDish(AddDishEvent event, Emitter<DishState> emit) async {
    emit(state.copyWith(isLoading: true));
    await dishRepository.saveDish(event.dish).then((value) {
      emit(state.copyWith(isSuccess: true, isLoading: false));
      EasyLoading.showSuccess("Dish added successfully");
    }).catchError((err) {
      emit(state.copyWith(error: err.toString(), isLoading: false));
      EasyLoading.showError("Failed to retrieve data ${err.toString()}");
    });
  }

  FutureOr<void> _updateDish(
      UpdateDishEvent event, Emitter<DishState> emit) async {
    emit(state.copyWith(isLoading: true));
    await dishRepository.updateDish(event.dish).then((value) {
      emit(state.copyWith(isSuccess: true, isLoading: false));
      EasyLoading.showSuccess("Dish updated successfully");
    }).catchError((err) {
      emit(state.copyWith(error: err.toString(), isLoading: false));
      EasyLoading.showError("Failed to delete ${err.toString()}");
    });
  }

  FutureOr<void> _deleteDish(
      DeleteDishEvent event, Emitter<DishState> emit) async {
    emit(state.copyWith(isLoading: true));
    await dishRepository.deleteDish(event.id).then((value) {
      emit(state.copyWith(isSuccess: true, isLoading: false));
      EasyLoading.showSuccess("Dish deleted successfully");
    }).catchError((err) {
      emit(state.copyWith(error: err.toString(), isLoading: false));
      EasyLoading.showError("Failed to delete ${err.toString()}");
    });
  }

  FutureOr<void> _searchDish(SearchDishEvent event, Emitter<DishState> emit) {
    emit(state.copyWith(isLoading: true));
    try {
      final dishes = dishRepository.searchDish(event.query);
      emit(state.copyWith(dishes: dishes, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  FutureOr<void> _filterDishByCategory(
      FilterDishEvent event, Emitter<DishState> emit) {
    emit(state.copyWith(isLoading: true));
    try {
      final dishes = dishRepository.filterDishByCategory(event.category);
      emit(state.copyWith(dishes: dishes, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  FutureOr<void> _sortDish(SortDishEvent event, Emitter<DishState> emit) {
    emit(state.copyWith(isLoading: true));
    try {
      final dishes = dishRepository.sortDish(event.field);
      emit(state.copyWith(dishes: dishes, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  FutureOr<void> _loadDishById(
      LoadDishByIdEvent event, Emitter<DishState> emit) async {
    emit(state.copyWith(isLoading: true));
    await dishRepository.getDishById(event.id).then((value) {
      emit(state.copyWith(dish: value, isLoading: false));
    }).catchError((err) {
      emit(state.copyWith(error: err.toString(), isLoading: false));
    });
  }

  FutureOr<void> _changeCategory(
      ChangeCategoryEvent event, Emitter<DishState> emit) {
    emit(state.copyWith(category: event.category));
  }

  FutureOr<void> _loadDishesByCategory(
      LoadDishesByCategoryEvent event, Emitter<DishState> emit) async {
    emit(state.copyWith(isLoading: true));
    await dishRepository.getDishesByCategory(event.category).then((value) {
      final List<DishModel> response = List.from(value);
      emit(state.copyWith(dishes: response, isLoading: false));
    }).catchError((err) {
      emit(state.copyWith(
          error: err.toString(), isLoading: false, isSuccess: false));
    });
  }
}
