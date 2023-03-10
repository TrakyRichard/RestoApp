part of 'dish_bloc.dart';

abstract class DishEvent {}

class LoadDishesEvent extends DishEvent {}

class AddDishEvent extends DishEvent {
  final DishModel dish;

  AddDishEvent({required this.dish});
}

class UpdateDishEvent extends DishEvent {
  final DishModel dish;

  UpdateDishEvent({required this.dish});
}

class DeleteDishEvent extends DishEvent {
  final String id;

  DeleteDishEvent({required this.id});
}

class SearchDishEvent extends DishEvent {
  final String query;

  SearchDishEvent(this.query);
}

class FilterDishEvent extends DishEvent {
  final String category;

  FilterDishEvent({required this.category});
}

class SortDishEvent extends DishEvent {
  final String field;

  SortDishEvent({required this.field});
}

class LoadDishByCategoryEvent extends DishEvent {
  final String category;

  LoadDishByCategoryEvent({required this.category});
}

class LoadDishByStatusEvent extends DishEvent {
  final String status;

  LoadDishByStatusEvent({required this.status});
}

class LoadDishByFeaturedEvent extends DishEvent {
  final String featured;

  LoadDishByFeaturedEvent({required this.featured});
}

class LoadDishByLabelEvent extends DishEvent {
  final String label;

  LoadDishByLabelEvent({required this.label});
}

class LoadDishByTimeToWaitEvent extends DishEvent {
  final String timeToWait;

  LoadDishByTimeToWaitEvent({required this.timeToWait});
}
