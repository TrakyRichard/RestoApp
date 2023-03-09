import 'package:commons/commons.dart';
import 'package:das/das.dart';
import 'package:get_it/get_it.dart';
import 'dishes/dishes.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<CrudDAS>(() => ApiService());
  locator.registerLazySingleton<DishRepository>(() => DishRepository());
}
