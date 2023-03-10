import 'package:commons/commons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/locator.dart';

import '../dishes.dart';

class EditDishPageArguments {
  final bool isEdit;
  final DishModel? dish;
  EditDishPageArguments({required this.isEdit, this.dish});
}

class EditDishPage extends StatefulWidget {
  final EditDishPageArguments args;
  static const String routeName = '/edit_new_dish';
  const EditDishPage({super.key, required this.args});

  @override
  State<EditDishPage> createState() => _EditDishPageState();
}

class _EditDishPageState extends State<EditDishPage> {
  final TextEditingController _nameController = TextEditingController(text: "");
  final TextEditingController _priceController =
      TextEditingController(text: "");
  final TextEditingController _descriptionController =
      TextEditingController(text: "");
  final TextEditingController _labelController =
      TextEditingController(text: "");
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _timeToWaitController = TextEditingController();
  final TextEditingController _ingredients = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.args.isEdit) {
      context
          .read<EditDishBloc>()
          .add(InitEditDishEvent(dish: widget.args.dish!));
      initTextControllers(widget.args.dish!);
    } else {
      context.read<EditDishBloc>().add(InitEditDishEvent(dish: initDishModel));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return Scaffold(
      appBar: appbar(title: widget.args.isEdit ? "Edit Dish" : "Add Dish"),
      body: BlocListener<DishBloc, DishState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.read<DishBloc>().add(LoadDishesByCategoryEvent(
                category: context.read<DishBloc>().state.category));
          }
        },
        child: BlocBuilder<EditDishBloc, EditDishState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                        title: "Name",
                        controller: _nameController,
                        onChanged: (value) {
                          context.read<EditDishBloc>().add(
                              EditDishNameEvent(name: _nameController.text));
                        },
                        validator: (value) => generiqueValidator(value, "Name"),
                        hint: "The Name of the dish",
                        icon: Icons.food_bank),
                    TimePicker(
                        controller: _startTimeController,
                        onTap: () {
                          context.read<EditDishBloc>().add(
                              EditDishStartTimeOfAvailabilityEvent(
                                  startTimeOfAvailability:
                                      _startTimeController.text));
                        },
                        title: "Start Time of the dish"),
                    TimePicker(
                        controller: _endTimeController,
                        onTap: () {
                          context.read<EditDishBloc>().add(
                              EditDishEndTimeOfAvailabilityEvent(
                                  endTimeOfAvailability:
                                      _endTimeController.text));
                        },
                        title: "End Time of the dish"),
                    TimePicker(
                        controller: _timeToWaitController,
                        onTap: () {
                          context.read<EditDishBloc>().add(
                              EditDishTimeToWaitEvent(
                                  timeToWait: _timeToWaitController.text));
                        },
                        title: "Time to wait for the dish"),
                    InputField(
                        title: "Price",
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          context.read<EditDishBloc>().add(
                              EditDishPriceEvent(price: _priceController.text));
                        },
                        validator: (value) {
                          return generiqueValidator(value, "Price") ??
                              (double.tryParse(value!) == null
                                  ? "The price must be a number"
                                  : null);
                        },
                        hint: "The Price of the dish",
                        icon: Icons.money),
                    InputField(
                        title: "Label",
                        controller: _labelController,
                        onChanged: (value) {
                          context.read<EditDishBloc>().add(
                              EditDishLabelEvent(label: _labelController.text));
                        },
                        validator: (value) =>
                            generiqueValidator(value, "Label"),
                        hint: "The label of the dish",
                        icon: Icons.label),
                    DropDownMenu(
                        dropdownItems: dropdownCategoryItems(),
                        onChanged: (value) {
                          context.read<EditDishBloc>().add(
                              EditDishCategoryEvent(
                                  category: value as CategoryEnum));
                        },
                        label: "Select Category",
                        selectedValue: state.category),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 0.5.sw,
                            height: 50.h,
                            child: GestureDetector(
                              onTap: () {
                                context.read<EditDishBloc>().add(
                                    EditDishIsFeaturedEvent(
                                        isFeatured: !context
                                            .read<EditDishBloc>()
                                            .state
                                            .featured));
                              },
                              child: CheckboxListTile(
                                title: Text(
                                  "Is Featured",
                                  style: theme.textTheme.bodyLarge,
                                ),
                                value: context
                                    .watch<EditDishBloc>()
                                    .state
                                    .featured,
                                activeColor: theme.primaryColor,
                                onChanged: (value) {
                                  context.read<EditDishBloc>().add(
                                      EditDishIsFeaturedEvent(
                                          isFeatured: !context
                                              .read<EditDishBloc>()
                                              .state
                                              .featured));
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.5.sw,
                            height: 50.h,
                            child: GestureDetector(
                              onTap: () {
                                context.read<EditDishBloc>().add(
                                    EditDishIsFeaturedEvent(
                                        isFeatured: !context
                                            .read<EditDishBloc>()
                                            .state
                                            .featured));
                              },
                              child: CheckboxListTile(
                                activeColor: theme.primaryColor,
                                value: context
                                    .watch<EditDishBloc>()
                                    .state
                                    .isAvailable,
                                title: Text(
                                  "Is Available",
                                  style: theme.textTheme.bodyLarge,
                                ),
                                onChanged: (value) {
                                  context.read<EditDishBloc>().add(
                                      EditDishIsAvailableEvent(
                                          isAvailable: !context
                                              .read<EditDishBloc>()
                                              .state
                                              .isAvailable));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 500.h,
                      height: 80.h,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 300.w,
                            height: 100.h,
                            child: InputField(
                                controller: _ingredients,
                                onChanged: (value) {
                                  context.read<EditDishBloc>().add(
                                      EditDishIngredientEvent(
                                          ingredient: value));
                                },
                                title: "Ingredient",
                                hint: "Add Ingredient",
                                icon: Icons.kitchen),
                          ),
                          Container(
                            width: 70.w,
                            height: 50.h,
                            alignment: Alignment.center,
                            child: elevatedButton(
                                onPressed: context
                                        .watch<EditDishBloc>()
                                        .state
                                        .ingredient
                                        .isNotEmpty
                                    ? () {
                                        context.read<EditDishBloc>().add(
                                            AddDishIngredientsEvent(
                                                ingredient: _ingredients.text));
                                        context.read<EditDishBloc>().add(
                                            const EditDishIngredientEvent(
                                                ingredient: ""));
                                        _ingredients.clear();
                                      }
                                    : () {},
                                label: "Add",
                                theme: theme,
                                isOutlined: context
                                    .watch<EditDishBloc>()
                                    .state
                                    .ingredient
                                    .isEmpty),
                          )
                        ],
                      ),
                    ),
                    /* Ingredient list */
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ingredient List",
                              style: theme.textTheme.bodyLarge),
                          state.ingredients.isNotEmpty
                              ? SizedBox(
                                  height: 100.h,
                                  child: ListView.builder(
                                    itemCount: state.ingredients.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: 50.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(state.ingredients[index],
                                                style:
                                                    theme.textTheme.bodyLarge),
                                            Container(
                                              height: 30.h,
                                              width: 50.w,
                                              alignment: Alignment.center,
                                              child: iconButton(
                                                  onPressed: () {
                                                    context
                                                        .read<EditDishBloc>()
                                                        .add(
                                                            RemoveDishIngredientEvent(
                                                                index: index));
                                                  },
                                                  icon: Icons.close,
                                                  activeColor:
                                                      theme.colorScheme.error,
                                                  inactiveColor:
                                                      theme.colorScheme.error),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : SizedBox(
                                  height: 30.h,
                                  child: const Text(
                                    "No Ingredient added",
                                    textAlign: TextAlign.left,
                                  ),
                                )
                        ],
                      ),
                    ),
                    InputField(
                        title: "Description",
                        controller: _descriptionController,
                        hint: "The Description of the dish",
                        minLines: 3,
                        maxLines: 5,
                        onChanged: (value) {
                          context.read<EditDishBloc>().add(
                              EditDishDescriptionEvent(
                                  description: _descriptionController.text));
                        },
                        validator: (value) =>
                            generiqueValidator(value, "Description"),
                        icon: Icons.description),
                    widget.args.isEdit
                        ? const SizedBox.shrink()
                        : ImagePicker(
                            onImageSelected: () {
                              context
                                  .read<EditDishBloc>()
                                  .add(const AddImagesEvent());
                            },
                            imageFiles:
                                context.watch<EditDishBloc>().state.images,
                          ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: SubmitButton(
                        label:
                            widget.args.isEdit == false ? "Submit" : "Update",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (widget.args.isEdit == false) {
                              EasyLoading.show(status: "Saving Dish");
                              await uploadFiles(state.images).then((value) {
                                final dish = DishModel(
                                    id: state.id,
                                    name: state.name,
                                    description: state.description,
                                    images: value,
                                    ingredients: state.ingredients,
                                    price: state.price,
                                    category: state.category,
                                    label: state.label,
                                    featured: state.featured,
                                    startTimeOfAvailability:
                                        _startTimeController.text,
                                    endTimeOfAvailability:
                                        _endTimeController.text,
                                    timeToWait: _timeToWaitController.text,
                                    isAvailable: state.isAvailable);
                                context
                                    .read<DishBloc>()
                                    .add(AddDishEvent(dish: dish));
                              });
                              EasyLoading.dismiss();
                            } else {
                              EasyLoading.show(status: "Updating Dish");
                              context.read<DishBloc>().add(UpdateDishEvent(
                                  dish: DishModel(
                                      id: state.id,
                                      name: state.name,
                                      description: state.description,
                                      images: state.imageUrls,
                                      ingredients: state.ingredients,
                                      price: state.price,
                                      category: state.category,
                                      label: state.label,
                                      featured: state.featured,
                                      startTimeOfAvailability:
                                          _startTimeController.text,
                                      endTimeOfAvailability:
                                          _endTimeController.text,
                                      timeToWait: _timeToWaitController.text,
                                      isAvailable: state.isAvailable)));
                            }

                            locator<NavigationService>().pop();
                          }
                        },
                        isOutlined: false,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  dropdownCategoryItems() {
    return CategoryEnum.values
        .map((cat) => cat)
        .toList()
        .map((e) => DropdownMenuItem(
              value: e,
              child: Text(mapCategoryStatusToString(e)),
            ))
        .toList();
  }

  void initTextControllers(DishModel dishModel) {
    _nameController.text = dishModel.name;
    _priceController.text = dishModel.price.toString();
    _labelController.text = dishModel.label;
    _descriptionController.text = dishModel.description;
    _startTimeController.text = dishModel.startTimeOfAvailability;
    _endTimeController.text = dishModel.endTimeOfAvailability;
    _timeToWaitController.text = dishModel.timeToWait;
  }
}
