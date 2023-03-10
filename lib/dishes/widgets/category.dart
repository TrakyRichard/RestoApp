import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  final String name;

  const Category({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return Container(
      width: 150.w,
      height: 100.h,
      margin: EdgeInsets.only(right: 10.w),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(28.r),
          child: elevatedButton(onPressed: () {}, label: name, theme: theme)),
    );
  }
}
// Container(
//       margin: EdgeInsets.only(right: 10.w),
//       alignment: Alignment.center,
//       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//       decoration: BoxDecoration(
//         color: theme.primaryColor,
//         borderRadius: BorderRadius.circular(28.r),
//       ),
//       child: Text(name,
//           style: theme.textTheme.bodyLarge?.copyWith(
//             color: Colors.white,
//           )),
//     );