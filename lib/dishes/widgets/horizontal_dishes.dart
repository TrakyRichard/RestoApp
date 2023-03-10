import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/locator.dart';

import '../dishes.dart';
import 'dish.dart';

class HorizontalDishes extends StatefulWidget {
  const HorizontalDishes({super.key});

  @override
  State<HorizontalDishes> createState() => _HorizontalDishesState();
}

class _HorizontalDishesState extends State<HorizontalDishes> {
  @override
  void initState() {
    context.read<DishBloc>().add(LoadDishesByCategoryEvent(
        category: context.read<DishBloc>().state.category));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return BlocBuilder<DishBloc, DishState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.dishes.isEmpty) {
          return const Center(child: Text("No dishes found"));
        }
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: Text(
                              "Dishes",
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => locator<NavigationService>()
                                .navigateTo(AllDishesPage.routeName),
                            child: Container(
                              margin: EdgeInsets.only(right: 10.w),
                              child: Text(
                                "See all",
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontSize: 16.sp,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.dishes.length,
                        itemBuilder: (context, index) {
                          return DishWidget(dish: state.dishes[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
