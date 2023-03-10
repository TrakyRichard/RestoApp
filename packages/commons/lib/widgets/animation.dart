import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AnimatedRoute extends PageRouteBuilder {
  final Widget widget;

  AnimatedRoute(this.widget)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

EasyLoading customAnimation(ThemeData theme) {
  return EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = theme.colorScheme.primary
    ..backgroundColor = theme.cardColor
    ..indicatorColor = theme.primaryColor
    ..textColor = theme.colorScheme.primary
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation;
}
