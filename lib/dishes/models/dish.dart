import 'package:json_annotation/json_annotation.dart';

part 'dish.g.dart';

@JsonSerializable(explicitToJson: true)
class DishModel {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final List<String> ingredients;
  final String price;
  final CategoryEnum category;
  final String label;
  final bool featured;
  final String startTimeOfAvailability;
  final String endTimeOfAvailability;
  final String timeToWait;
  final bool isAvailable;

  DishModel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.ingredients,
    required this.price,
    required this.category,
    required this.label,
    required this.featured,
    required this.startTimeOfAvailability,
    required this.endTimeOfAvailability,
    required this.timeToWait,
    required this.isAvailable,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}

enum CategoryEnum {
  @JsonValue('MainCourse')
  mainCourse,
  @JsonValue('Appetizers')
  appetizers,
  @JsonValue('Desserts')
  desserts,
  @JsonValue('additionalDishes')
  additionalDishes,
}

enum Status {
  @JsonValue('ativated')
  activated,
  @JsonValue('desativated')
  desactivated,
}

List<DishModel> mock = [
  DishModel(
    id: '1',
    name: 'Burger',
    description: 'Burger description',
    images: [
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
    ],
    ingredients: [
      'ingredient 1',
      'ingredient 2',
      'ingredient 3',
    ],
    price: '10',
    category: CategoryEnum.mainCourse,
    label: 'label',
    featured: true,
    startTimeOfAvailability: '10:00',
    endTimeOfAvailability: '20:00',
    timeToWait: '10',
    isAvailable: true,
  ),
  DishModel(
    id: '2',
    name: 'Burger',
    description: 'Burger description',
    images: [
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
    ],
    price: '10',
    category: CategoryEnum.mainCourse,
    label: 'label',
    ingredients: [
      'ingredient 1',
      'ingredient 2',
      'ingredient 3',
    ],
    featured: true,
    startTimeOfAvailability: '10:00',
    endTimeOfAvailability: '20:00',
    timeToWait: '10',
    isAvailable: true,
  ),
  DishModel(
    id: '3',
    name: 'Burger',
    description: 'Burger description',
    images: [
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
    ],
    ingredients: [
      'ingredient 1',
      'ingredient 2',
      'ingredient 3',
    ],
    price: '10',
    category: CategoryEnum.mainCourse,
    label: 'label',
    featured: true,
    startTimeOfAvailability: '10:00',
    endTimeOfAvailability: '20:00',
    timeToWait: '10',
    isAvailable: true,
  ),
  DishModel(
    id: '4',
    name: 'Burger',
    description: 'Burger description',
    images: [
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
      'https://img.cuisineaz.com/660x660/2018/02/28/i136025-pizza-legere.jpeg',
    ],
    ingredients: [
      'ingredient 1',
      'ingredient 2',
      'ingredient 3',
    ],
    price: '10',
    category: CategoryEnum.mainCourse,
    label: 'label',
    featured: true,
    startTimeOfAvailability: '10:00',
    endTimeOfAvailability: '20:00',
    timeToWait: '10',
    isAvailable: true,
  ),
];
