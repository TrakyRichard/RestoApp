import 'package:flutter/material.dart';

export 'api_constants.dart';

ThemeData getTheme(BuildContext context) {
  return Theme.of(context);
}

Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
