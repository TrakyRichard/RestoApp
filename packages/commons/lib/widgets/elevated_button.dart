import 'package:flutter/material.dart';

ElevatedButton elevatedButton(
    {required Function() onPressed,
    required String label,
    required ThemeData theme,
    bool? isOutlined}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: isOutlined ?? false
          ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 188, 206, 213)))
          : ButtonStyle(
              backgroundColor: MaterialStateProperty.all(theme.primaryColor)),
      child: Container(
        width: double.infinity,
        height: 40.0,
        child: Center(
            child: Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
              color: isOutlined ?? false ? theme.primaryColor : theme.cardColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600),
        )),
      ));
}

class IconBtn extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final bool isActive;
  const IconBtn(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.activeColor,
      required this.inactiveColor,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isActive ? activeColor : inactiveColor)),
        child: SizedBox(
          width: double.infinity,
          height: 40.0,
          child: Center(
              child: Icon(icon, color: isActive ? inactiveColor : activeColor)),
        ));
  }
}

ElevatedButton iconButton(
    {required Function() onPressed,
    required IconData icon,
    required Color activeColor,
    required Color inactiveColor,
    bool? isActive}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              isActive ?? false ? activeColor : inactiveColor)),
      child: SizedBox(
        width: double.infinity,
        height: 40.0,
        child: Center(
            child: Icon(icon,
                color: isActive ?? false ? inactiveColor : activeColor)),
      ));
}
