import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class DishesPage extends StatefulWidget {
  static const String routeName = '/dishes';
  const DishesPage({super.key});

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: "Dishes", automaticallyImplyLeading: false),
    );
  }
}
