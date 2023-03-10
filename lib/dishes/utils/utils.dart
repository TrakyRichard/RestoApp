import '../dishes.dart';

String mapCategoryStatusToString(CategoryEnum category) {
  switch (category) {
    case CategoryEnum.mainCourse:
      return 'Main Course';
    case CategoryEnum.appetizers:
      return 'Appetizers';
    case CategoryEnum.desserts:
      return 'Desserts';
    case CategoryEnum.additionalDishes:
      return 'Additional Dishes';
    default:
      return '';
  }
}
