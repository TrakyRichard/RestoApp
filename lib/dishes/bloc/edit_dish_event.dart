part of 'edit_dish_bloc.dart';

abstract class EditDishEvent extends Equatable {
  const EditDishEvent();

  @override
  List<Object> get props => [];
}

class EditDishNameEvent extends EditDishEvent {
  final String name;

  const EditDishNameEvent({required this.name});
}

class EditDishDescriptionEvent extends EditDishEvent {
  final String description;

  const EditDishDescriptionEvent({required this.description});
}

class EditDishImagesEvent extends EditDishEvent {
  final List<XFile> images;

  const EditDishImagesEvent({required this.images});
}

class EditDishIngredientsEvent extends EditDishEvent {
  final List<String> ingredients;

  const EditDishIngredientsEvent({required this.ingredients});
}

class AddDishIngredientsEvent extends EditDishEvent {
  final String ingredient;

  const AddDishIngredientsEvent({required this.ingredient});
}

class RemoveDishIngredientEvent extends EditDishEvent {
  final int index;

  const RemoveDishIngredientEvent({required this.index});
}

class EditDishPriceEvent extends EditDishEvent {
  final String price;

  const EditDishPriceEvent({required this.price});
}

class EditDishCategoryEvent extends EditDishEvent {
  final CategoryEnum category;

  const EditDishCategoryEvent({required this.category});
}

class EditDishLabelEvent extends EditDishEvent {
  final String label;

  const EditDishLabelEvent({required this.label});
}

class EditDishFeaturedEvent extends EditDishEvent {
  final bool featured;

  const EditDishFeaturedEvent({required this.featured});
}

class UploadImagesEvent extends EditDishEvent {
  final List<XFile> images;

  const UploadImagesEvent({required this.images});
}

class EditDishStartTimeOfAvailabilityEvent extends EditDishEvent {
  final String startTimeOfAvailability;

  const EditDishStartTimeOfAvailabilityEvent(
      {required this.startTimeOfAvailability});
}

class EditDishEndTimeOfAvailabilityEvent extends EditDishEvent {
  final String endTimeOfAvailability;

  const EditDishEndTimeOfAvailabilityEvent(
      {required this.endTimeOfAvailability});
}

class EditDishTimeToWaitEvent extends EditDishEvent {
  final String timeToWait;

  const EditDishTimeToWaitEvent({required this.timeToWait});
}

class EditDishIsAvailableEvent extends EditDishEvent {
  final bool isAvailable;

  const EditDishIsAvailableEvent({required this.isAvailable});
}

class EditDishIsFeaturedEvent extends EditDishEvent {
  final bool isFeatured;

  const EditDishIsFeaturedEvent({required this.isFeatured});
}

class EditDishIngredientEvent extends EditDishEvent {
  final String ingredient;

  const EditDishIngredientEvent({required this.ingredient});
}

class AddImagesEvent extends EditDishEvent {
  const AddImagesEvent();
}

class EditDishResetEvent extends EditDishEvent {}

class EditDishSaveEvent extends EditDishEvent {}

class EditDishDeleteEvent extends EditDishEvent {}

class EditDishCancelEvent extends EditDishEvent {}

class InitEditDishEvent extends EditDishEvent {
  final DishModel dish;

  const InitEditDishEvent({required this.dish});
}
