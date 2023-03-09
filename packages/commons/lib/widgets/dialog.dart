import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

Future<Widget?> messageDialog(BuildContext context, String title,
    String description, void Function()? onPressed) {
  return showDialog<Widget>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: Text(description),
            actions: <Widget>[
              TextButton(
                onPressed: onPressed,
                child: const Text('OK'),
              ),
            ],
          ));
}

Future<void> isConfirmDialog(
    {required BuildContext context,
    required String title,
    required String confirmText,
    required Function isConfirmAction,
    required String message,
    required bool isBarrierDismiss,
    bool? isError}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: isBarrierDismiss, // user must tap button!
    builder: (BuildContext context) {
      final theme = Theme.of(context);
      return AlertDialog(
        title: Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 20,
              color: isError == true
                  ? theme.colorScheme.error
                  : theme.primaryColor),
        ),
        content: SingleChildScrollView(
          child: Text(
            message,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontSize: 20, color: Colors.black54),
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(theme.secondaryHeaderColor)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Cancel",
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.primaryColor),
            ),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(isError == true
                    ? theme.colorScheme.error
                    : theme.primaryColor)),
            onPressed: () {
              isConfirmAction();
            },
            child: Text(
              confirmText,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
