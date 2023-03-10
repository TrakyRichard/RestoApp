import 'package:commons/commons.dart';

import '../../locator.dart';
import '../dishes.dart';

class DishRepository {
  Future<List<DishModel>> getDishes() async {
    final apiService = locator<ApiService>();
    final response =
        await apiService.getAll(AppUrl.dishesEndpoint).then((value) {
      return value.map((e) => DishModel.fromJson(e)).toList();
    }).catchError((e) {
      throw e.message;
    });
    return response;
  }

  Future<DishModel> getDishById(String id) async {
    final apiService = locator<ApiService>();
    final response =
        await apiService.getById(id, AppUrl.dishesEndpoint).then((value) {
      return DishModel.fromJson(value);
    }).catchError((e) {
      throw e.message;
    });
    return response;
  }

  Future<dynamic> saveDish(DishModel dish) async {
    final apiService = locator<ApiService>();
    return await apiService
        .save(dish.toJson(), AppUrl.dishesEndpoint)
        .then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
  }

  Future<void> updateDish(DishModel dish) async {
    final apiService = locator<ApiService>();
    await apiService.update(dish.toJson(), AppUrl.dishesEndpoint).then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
  }

  Future<void> deleteDish(String id) async {
    final apiService = locator<ApiService>();
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
