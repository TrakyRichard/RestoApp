import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/dishes/dishes.dart';

class Categories extends StatefulWidget {
  final List<String> categories;
  const Categories({super.key, required this.categories});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Categories", style: theme.textTheme.bodyLarge),
          SizedBox(height: 18.h),
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                return Category(name: widget.categories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
