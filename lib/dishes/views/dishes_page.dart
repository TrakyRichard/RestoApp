import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/locator.dart';

import '../dishes.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderCard(),
            SizedBox(height: 20.sp),
            Categories(
                categories: CategoryEnum.values
                    .map((cat) => mapCategoryStatusToString(cat))
                    .toList()),
            SizedBox(height: 10.sp),
            HorizontalDishes(dishes: mock),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<NavigationService>().navigateTo(EditDishPage.routeName,
              arguments: EditDishPageArguments(isEdit: false));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
