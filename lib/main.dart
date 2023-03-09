import 'dart:async';

import 'package:commons/commons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/simple_bloc_observer.dart';
import 'package:restaurant/welcome/welcome.dart';

import './dishes/dishes.dart';
import 'locator.dart';
import 'router.dart';

void main() {
  setUpLocator();

  BlocOverrides.runZoned(
    () {
      // Use blocs...
      if (kDebugMode) {
        runZonedGuarded<Future<void>>(() async {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
              .then((value) => runApp(const MyApp()));
        }, (error, stackTrace) {
          logger.e('Uncaught error: $error, StackTrace: $stackTrace');
          // FirebaseCrashlytics.instance
          //     .recordError(error, stackTrace, fatal: true);
        });
      } else {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
            .then(
          (value) => runApp(
            const MyApp(),
          ),
        );
      }
    },
    blocObserver: kDebugMode ? SimpleBlocObserver() : null,
  );
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
        BlocProvider<WelcomeCubit>(create: (context) => WelcomeCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844), // based on Iphone 12 Pro
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Dishes App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: generateRoute,
            navigatorKey: locator<NavigationService>().navigationKey,
            home: const WelcomePage(),
          );
        },
      ),
    );
  }
}
