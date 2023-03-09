// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      price: json['price'] as String,
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      label: json['label'] as String,
      featured: json['featured'] as String,
      startTimeOfAvailability: json['startTimeOfAvailability'] as String,
      endTimeOfAvailability: json['endTimeOfAvailability'] as String,
      timeToWait: json['timeToWait'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      comments: json['comments'] as String,
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'price': instance.price,
      'category': _$CategoryEnumMap[instance.category]!,
      'label': instance.label,
      'featured': instance.featured,
      'startTimeOfAvailability': instance.startTimeOfAvailability,
      'endTimeOfAvailability': instance.endTimeOfAvailability,
      'timeToWait': instance.timeToWait,
      'status': _$StatusEnumMap[instance.status]!,
      'comments': instance.comments,
    };

const _$CategoryEnumMap = {
  Category.mainCourse: 'MainCourse',
  Category.appetizers: 'Appetizers',
  Category.desserts: 'Desserts',
  Category.additionalDishes: 'Salad',
};

const _$StatusEnumMap = {
  Status.activated: 'ativated',
  Status.desactivated: 'desativated',
};
