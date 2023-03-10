import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/dishes/dishes.dart';
import 'package:restaurant/locator.dart';

class DishDetailsPageArguments {
  final String id;
  DishDetailsPageArguments(this.id);
}

class DishDetailsPage extends StatefulWidget {
  static const String routeName = '/dish_details';
  final DishDetailsPageArguments args;
  const DishDetailsPage({super.key, required this.args});

  @override
  State<DishDetailsPage> createState() => _DishDetailsPageState();
}

class _DishDetailsPageState extends State<DishDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    final size = getSize(context);
    return SingleChildScrollView(
        child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
            ),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 300.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            image: DecorationImage(
                              image: NetworkImage(mock[0].images[0]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            margin: EdgeInsets.only(left: 10.w),
                            width: 40.w,
                            height: 40.h,
                            alignment: Alignment.center,
                            child: iconButton(
                                onPressed: () {
                                  locator<NavigationService>().pop();
                                },
                                icon: Icons.arrow_back_ios,
                                activeColor: theme.primaryColor,
                                inactiveColor: theme.colorScheme.onBackground),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.only(right: 10.w),
                            width: 40.w,
                            height: 40.h,
                            alignment: Alignment.bottomCenter,
                            child: iconButton(
                                onPressed: () {},
                                icon: Icons.menu,
                                activeColor: theme.primaryColor,
                                inactiveColor: theme.colorScheme.onBackground),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mock[0].name,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontSize: 20.sp,
                                )),
                            SizedBox(height: 10.h),
                            Text("\$${mock[0].price}",
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontSize: 16.sp,
                                )),
                            SizedBox(height: 10.h),
                            Text("Ingredients: ",
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontSize: 16.sp,
                                )),
                            SizedBox(height: 10.h),
                            Text(mock[0].ingredients.join(", "),
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontSize: 16.sp,
                                )),
                            SizedBox(height: 10.h),
                            Text(mock[0].description,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontSize: 16.sp,
                                )),
                            SizedBox(height: 10.h),
                          ]),
                    ),
                  ]),
            )));
  }
}
