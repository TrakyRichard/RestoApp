import 'package:json_annotation/json_annotation.dart';

part 'dish.g.dart';

@JsonSerializable(explicitToJson: true)
class Dish {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final String price;
  final Category category;
  final String label;
  final String featured;
  final String startTimeOfAvailability;
  final String endTimeOfAvailability;
  final String timeToWait;
  final Status status;
  final String comments;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.category,
    required this.label,
    required this.featured,
    required this.startTimeOfAvailability,
    required this.endTimeOfAvailability,
    required this.timeToWait,
    required this.status,
    required this.comments,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
  Map<String, dynamic> toJson() => _$DishToJson(this);
}

enum Category {
  @JsonValue('MainCourse')
  mainCourse,
  @JsonValue('Appetizers')
  appetizers,
  @JsonValue('Desserts')
  desserts,
  @JsonValue('Salad')
  additionalDishes,
}

enum Status {
  @JsonValue('ativated')
  activated,
  @JsonValue('desativated')
  desactivated,
}
