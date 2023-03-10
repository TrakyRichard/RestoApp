import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dishes.dart';
import 'dish.dart';

class HorizontalDishes extends StatefulWidget {
  final List<DishModel> dishes;
  const HorizontalDishes({super.key, required this.dishes});

  @override
  State<HorizontalDishes> createState() => _HorizontalDishesState();
}

class _HorizontalDishesState extends State<HorizontalDishes> {
  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 100.h,
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
                      Container(
                        margin: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "See all",
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontSize: 16.sp,
                            color: theme.colorScheme.secondary,
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
                    itemCount: widget.dishes.length,
                    itemBuilder: (context, index) {
                      return DishWidget(dish: widget.dishes[index]);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
