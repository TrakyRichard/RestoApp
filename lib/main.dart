import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/welcome/welcome.dart';

import './dishes/dishes.dart';
import 'locator.dart';
import 'router.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DishBloc>(
          create: (context) => DishBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Dishes App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: generateRoute,
        navigatorKey: locator<NavigationService>().navigationKey,
        home: const WelcomePage(),
      ),
    );
  }
}
