import 'package:commons/commons.dart';

import '../../locator.dart';
import '../dishes.dart';

class DishRepository {
  getDishes() async {
    final apiService = locator<ApiService>();
    return await apiService.getAll(AppUrl.dishesEndpoint).then((value) {
      final response = value.map((e) => DishModel.fromJson(e)).toList();
      return response;
    }).catchError((e) {
      throw e.message;
    });
  }

  getDishById(String id) async {
    final apiService = locator<ApiService>();
    final response =
        await apiService.getById(id, AppUrl.dishesEndpoint).then((value) {
      return DishModel.fromJson(value);
    }).catchError((e) {
      throw e.message;
    });
    return response;
  }

  saveDish(DishModel dish) async {
    final apiService = locator<ApiService>();
    final data = dish.toJson();
    data.remove("id");
    return await apiService.save(data, AppUrl.dishesEndpoint).then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
  }

  updateDish(DishModel dish) async {
    final apiService = locator<ApiService>();
    final data = dish.toJson();
    data.addEntries([MapEntry("_id", dish.id)]);
    data.remove("id");
    return await apiService.update(data, AppUrl.dishesEndpoint).then((value) {
      return value;
    }).catchError((e) {
      throw e.message;
    });
  }

  deleteDish(String id) async {
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

  getDishesByCategory(CategoryEnum category) async {
    final apiService = locator<ApiService>();
    return await apiService
        .getAll("${AppUrl.categoriesEndpoint}/$category")
        .then((value) {
      final response = value.map((e) => DishModel.fromJson(e)).toList();
      return response;
    }).catchError((e) {
      throw e.message;
    });
  }
}
