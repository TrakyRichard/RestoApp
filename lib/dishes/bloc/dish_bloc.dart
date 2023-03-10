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
  DishBloc() : super(const DishState(dishes: [], isLoading: false, error: "")) {
    on<DishEvent>((event, emit) {});
    on<LoadDishesEvent>(_loadDish);
    on<AddDishEvent>(_addDish);
    on<UpdateDishEvent>(_updateDish);
    on<DeleteDishEvent>(_deleteDish);
    on<SearchDishEvent>(_searchDish);
    on<FilterDishEvent>(_filterDishByCategory);
    on<SortDishEvent>(_sortDish);
  }

  FutureOr<void> _loadDish(
      LoadDishesEvent event, Emitter<DishState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final dishes = await dishRepository.getDishes();
      emit(state.copyWith(dishes: dishes, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  FutureOr<void> _addDish(AddDishEvent event, Emitter<DishState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await dishRepository.saveDish(event.dish);
      if (response.data["status"] == "OK") {
        EasyLoading.showSuccess("Dish added successfully");
      } else {
        EasyLoading.showError(response["message"]);
      }
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  FutureOr<void> _updateDish(UpdateDishEvent event, Emitter<DishState> emit) {
    emit(state.copyWith(isLoading: true));
    try {
      dishRepository.updateDish(event.dish);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  FutureOr<void> _deleteDish(DeleteDishEvent event, Emitter<DishState> emit) {
    emit(state.copyWith(isLoading: true));
    try {
      dishRepository.deleteDish(event.id);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
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
}
