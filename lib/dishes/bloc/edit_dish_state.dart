part of 'edit_dish_bloc.dart';

class EditDishState extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<XFile> images;
  final List<String> imageUrls;
  final List<String> ingredients;
  final String price;
  final String ingredient;
  final CategoryEnum category;
  final String label;
  final bool featured;
  final String startTimeOfAvailability;
  final String endTimeOfAvailability;
  final String timeToWait;
  final bool isAvailable;

  const EditDishState({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.imageUrls,
    required this.ingredients,
    required this.price,
    required this.ingredient,
    required this.category,
    required this.label,
    required this.featured,
    required this.startTimeOfAvailability,
    required this.endTimeOfAvailability,
    required this.timeToWait,
    required this.isAvailable,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        images,
        ingredients,
        price,
        ingredient,
        category,
        label,
        featured,
        startTimeOfAvailability,
        endTimeOfAvailability,
        timeToWait,
        isAvailable,
      ];

  EditDishState copyWith({
    String? id,
    String? name,
    String? description,
    List<XFile>? images,
    List<String>? imageUrls,
    List<String>? ingredients,
    String? price,
    String? ingredient,
    CategoryEnum? category,
    String? label,
    bool? featured,
    String? startTimeOfAvailability,
    String? endTimeOfAvailability,
    String? timeToWait,
    bool? isAvailable,
  }) {
    return EditDishState(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      imageUrls: imageUrls ?? this.imageUrls,
      ingredients: ingredients ?? this.ingredients,
      price: price ?? this.price,
      ingredient: ingredient ?? this.ingredient,
      category: category ?? this.category,
      label: label ?? this.label,
      featured: featured ?? this.featured,
      startTimeOfAvailability:
          startTimeOfAvailability ?? this.startTimeOfAvailability,
      endTimeOfAvailability:
          endTimeOfAvailability ?? this.endTimeOfAvailability,
      timeToWait: timeToWait ?? this.timeToWait,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
