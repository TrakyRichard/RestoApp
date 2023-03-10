import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dishes.dart';
import '../widgets/dish.dart';

class AllDishesPage extends StatefulWidget {
  static const String routeName = '/all_dishes';
  const AllDishesPage({super.key});

  @override
  State<AllDishesPage> createState() => _AllDishesPageState();
}

class _AllDishesPageState extends State<AllDishesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishBloc, DishState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appbar(title: "All Dishes", automaticallyImplyLeading: true),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            padding: const EdgeInsets.all(10),
            itemCount: state.dishes.length,
            itemBuilder: (context, index) {
              return DishWidget(dish: state.dishes[index]);
            },
          ),
        );
      },
    );
  }
}
