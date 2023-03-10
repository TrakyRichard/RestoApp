import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/locator.dart';

import '../dishes.dart';

class DishWidget extends StatelessWidget {
  final DishModel dish;
  const DishWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(DishDetailsPage.routeName,
            arguments: DishDetailsPageArguments(dish.id));
      },
      child: Hero(
        tag: dish.id,
        child: Container(
          margin: EdgeInsets.only(right: 18.w),
          width: 150.w,
          height: 150.h,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.background,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.background.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 80.h,
                margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.r),
                  image: DecorationImage(
                    image: NetworkImage(dish.images[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(dish.name,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 16.sp,
                  )),
              SizedBox(height: 5.h),
              Text(dish.description,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 12.sp,
                    color: theme.hintColor,
                  )),
              SizedBox(height: 5.h),
              Text("\$${dish.price}",
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 18.sp,
                    color: theme.primaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
