import 'package:restaurant/dishes/dishes.dart';

EditDishState initDishState = const EditDishState(
    id: "",
    name: "ezd",
    description: "sdc",
    images: [],
    imageUrls: [],
    ingredients: [],
    price: "12",
    ingredient: "dswf",
    category: CategoryEnum.mainCourse,
    label: "eqdfc",
    featured: false,
    startTimeOfAvailability: "",
    endTimeOfAvailability: "",
    timeToWait: "",
    isAvailable: true);

DishModel initDishModel = DishModel(
    id: "",
    name: "",
    description: "",
    images: [],
    ingredients: [],
    price: "",
    category: CategoryEnum.mainCourse,
    label: "",
    featured: false,
    startTimeOfAvailability: "",
    endTimeOfAvailability: "",
    timeToWait: "",
    isAvailable: true);

EditDishState mapDishInEditState(DishModel dish) {
  return EditDishState(
      id: dish.id,
      name: dish.name,
      description: dish.description,
      images: [],
      imageUrls: dish.images,
      ingredients: dish.ingredients,
      price: dish.price,
      ingredient: "",
      category: dish.category,
      label: dish.label,
      featured: dish.featured,
      startTimeOfAvailability: dish.startTimeOfAvailability,
      endTimeOfAvailability: dish.endTimeOfAvailability,
      timeToWait: dish.timeToWait,
      isAvailable: dish.isAvailable);
}
