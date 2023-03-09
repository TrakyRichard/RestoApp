part of 'dish_bloc.dart';

abstract class DishEvent {}

class LoadDishesEvent extends DishEvent {}

class AddDishEvent extends DishEvent {
  final Dish dish;

  AddDishEvent(this.dish);
}

class UpdateDishEvent extends DishEvent {
  final Dish dish;

  UpdateDishEvent(this.dish);
}

class DeleteDishEvent extends DishEvent {
  final String id;

  DeleteDishEvent(this.id);
}

class SearchDishEvent extends DishEvent {
  final String query;

  SearchDishEvent(this.query);
}

class FilterDishEvent extends DishEvent {
  final String category;

  FilterDishEvent(this.category);
}

class SortDishEvent extends DishEvent {
  final String field;

  SortDishEvent(this.field);
}

class LoadDishByCategoryEvent extends DishEvent {
  final String category;

  LoadDishByCategoryEvent(this.category);
}

class LoadDishByStatusEvent extends DishEvent {
  final String status;

  LoadDishByStatusEvent(this.status);
}

class LoadDishByFeaturedEvent extends DishEvent {
  final String featured;

  LoadDishByFeaturedEvent(this.featured);
}

class LoadDishByLabelEvent extends DishEvent {
  final String label;

  LoadDishByLabelEvent(this.label);
}

class LoadDishByTimeToWaitEvent extends DishEvent {
  final String timeToWait;

  LoadDishByTimeToWaitEvent(this.timeToWait);
}
