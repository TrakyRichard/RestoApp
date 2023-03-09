part of 'dish_bloc.dart';

class DishState extends Equatable {
  final List<Dish> dishes;
  final bool isLoading;
  final String? error;
  const DishState({
    required this.dishes,
    required this.isLoading,
    this.error,
  });

  DishState copyWith({
    List<Dish>? dishes,
    bool? isLoading,
    String? error,
  }) {
    return DishState(
      dishes: dishes ?? this.dishes,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [dishes, isLoading, error];
}
