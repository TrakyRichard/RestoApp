import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dishes.dart';

class Category extends StatelessWidget {
  final CategoryModel category;
  const Category({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return BlocBuilder<DishBloc, DishState>(
      builder: (context, state) {
        return Container(
          width: 180.w,
          height: 100.h,
          margin: EdgeInsets.only(right: 10.w),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(28.r),
              child:
                  // ignore: unrelated_type_equality_checks
                  elevatedButton(
                      onPressed: () {
                        context
                            .read<DishBloc>()
                            .add(ChangeCategoryEvent(category: category.key));
                        context.read<DishBloc>().add(
                            LoadDishesByCategoryEvent(category: category.key));
                      },
                      label: category.name,
                      theme: theme,
                      isOutlined: state.category != category.key)),
        );
      },
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