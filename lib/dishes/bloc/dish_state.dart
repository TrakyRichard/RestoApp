part of 'dish_bloc.dart';

class DishState extends Equatable {
  final List<DishModel> dishes;
  final DishModel dish;
  final bool isLoading;
  final bool isSuccess;
  final CategoryEnum category;
  final String? error;
  const DishState({
    required this.dishes,
    required this.dish,
    required this.category,
    required this.isLoading,
    required this.isSuccess,
    this.error,
  });

  DishState copyWith({
    List<DishModel>? dishes,
    DishModel? dish,
    bool? isLoading,
    bool? isSuccess,
    String? error,
    CategoryEnum? category,
  }) {
    return DishState(
      dishes: dishes ?? this.dishes,
      dish: dish ?? this.dish,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props =>
      [dishes, isLoading, error, isSuccess, dish, category];
}
