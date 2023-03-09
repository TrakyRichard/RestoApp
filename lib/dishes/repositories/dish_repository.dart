import 'package:commons/commons.dart';

import '../../locator.dart';
import '../dishes.dart';

class DishRepository {
  final apiService = locator<ApiService>();

  Future<List<Dish>> getDishes() async {
    final response =
        await apiService.getAll(AppUrl.dishesEndpoint).then((value) {
      return value.map((e) => Dish.fromJson(e)).toList();
    }).catchError((e) {
      throw e.message;
    });
    return response;
  }

  Future<Dish> getDishById(String id) async {
    final response =
        await apiService.getById(id, AppUrl.dishesEndpoint).then((value) {
      return Dish.fromJson(value);
    }).catchError((e) {
      throw e.message;
    });
    return response;
  }

  Future<void> saveDish(Dish dish) async {
    await apiService.save(dish.toJson(), AppUrl.dishesEndpoint).then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
  }

  Future<void> updateDish(Dish dish) async {
    await apiService.update(dish.toJson(), AppUrl.dishesEndpoint).then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
  }

  Future<void> deleteDish(String id) async {
    await apiService.delete(id, AppUrl.dishesEndpoint).then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
  }

  searchDish(String query) {}

  filterDishByCategory(String category) {}

  sortDish(String field) {}
}
