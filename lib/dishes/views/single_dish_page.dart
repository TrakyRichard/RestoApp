import 'package:flutter/material.dart';

class SingleDishPageArguments {
  final String id;
  SingleDishPageArguments(this.id);
}

class SingleDishPage extends StatefulWidget {
  static const String routeName = '/single_dishe';
  final SingleDishPageArguments args;
  const SingleDishPage({super.key, required this.args});

  @override
  State<SingleDishPage> createState() => _SingleDishPageState();
}

class _SingleDishPageState extends State<SingleDishPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
