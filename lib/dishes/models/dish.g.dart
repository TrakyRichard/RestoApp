// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishModel _$DishModelFromJson(Map<String, dynamic> json) => DishModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: json['price'] as String,
      category: $enumDecode(_$CategoryEnumEnumMap, json['category']),
      label: json['label'] as String,
      featured: json['featured'] as bool,
      startTimeOfAvailability: json['startTimeOfAvailability'] as String,
      endTimeOfAvailability: json['endTimeOfAvailability'] as String,
      timeToWait: json['timeToWait'] as String,
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$DishModelToJson(DishModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'ingredients': instance.ingredients,
      'price': instance.price,
      'category': _$CategoryEnumEnumMap[instance.category]!,
      'label': instance.label,
      'featured': instance.featured,
      'startTimeOfAvailability': instance.startTimeOfAvailability,
      'endTimeOfAvailability': instance.endTimeOfAvailability,
      'timeToWait': instance.timeToWait,
      'isAvailable': instance.isAvailable,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.mainCourse: 'MainCourse',
  CategoryEnum.appetizers: 'Appetizers',
  CategoryEnum.desserts: 'Desserts',
  CategoryEnum.additionalDishes: 'additionalDishes',
};
