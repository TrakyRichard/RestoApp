import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../commons.dart';

class RadioTitle<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget subTitle;
  final String label;
  final void Function(Object?)? onChanged;
  const RadioTitle(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.label,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    final size = getSize(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          Container(
              width: size.width * 0.2,
              child: Text(label, style: theme.textTheme.bodyLarge)),
          Container(
            width: size.width * 0.2,
            child: RadioListTile<T>(
              contentPadding: EdgeInsets.zero,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              subtitle: subTitle,
            ),
          ),
        ],
      ),
    );
  }
}
