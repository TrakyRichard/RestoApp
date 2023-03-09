import 'package:flutter/material.dart';

AppBar appbar(
    {required String title, bool? automaticallyImplyLeading, Function? back}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
    ),
    leading: back != null
        ? IconButton(
            icon: const Icon(Icons.arrow_back_ios), onPressed: () => back())
        : null,
    iconTheme: const IconThemeData(color: Colors.white),
    centerTitle: false,
    backgroundColor: Colors.teal,
    elevation: 0.0,
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
  );
}
