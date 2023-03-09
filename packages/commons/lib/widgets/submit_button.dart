import 'package:commons/constants/constants.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final bool isOutlined;

  const SubmitButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.isOutlined});

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: isOutlined
                  ? [Colors.black, Colors.grey]
                  : [theme.primaryColor, theme.colorScheme.secondary]),
        ),
        child: Text(label,
            style: TextStyle(
                fontSize: 14, color: isOutlined ? Colors.white : Colors.white)),
      ),
    );
  }
}

class OutlinedSubmitButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final bool isOutlined;

  const OutlinedSubmitButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.isOutlined});

  @override
  Widget build(BuildContext context) {
    final theme = getTheme(context);
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black54),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)))),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            alignment: Alignment.center,
            child: Text(label,
                style: TextStyle(
                    fontSize: 14,
                    color: isOutlined ? Colors.white : theme.primaryColor))));
  }
}
