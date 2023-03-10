import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HeaderCard extends StatefulWidget {
  const HeaderCard({super.key});

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    final size = getSize(context);
    return Container(
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.disabledColor,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        height: size.height * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 200.h,
              width: size.width * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to our",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    "Foodie App",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.primaryColor,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 35.h,
                    width: 100.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: elevatedButton(
                          onPressed: () {},
                          label: "Create",
                          theme: theme,
                          isOutlined: false),
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              "assets/svgs/card_header.svg",
              height: 85.h,
              fit: BoxFit.cover,
              width: size.width * 0.4,
            ),
          ],
        ),
      ),
    );
  }
}
