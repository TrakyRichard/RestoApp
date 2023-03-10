import 'dart:async';

import 'package:commons/commons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/simple_bloc_observer.dart';
import 'package:restaurant/welcome/welcome.dart';

import './dishes/dishes.dart';
import 'locator.dart';
import 'router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider<EditDishBloc>(create: (context) => EditDishBloc()),
        BlocProvider(
          create: (context) {
            var defaultThemode = locator<LocalStorageService>().themeMode;
            switch (defaultThemode) {
              case ThemeMode.system:
                return ThemeCubit(
                    ThemeSystem(themeBrightness: Theme.of(context).brightness));
              case ThemeMode.light:
                return ThemeCubit(const ThemeLight());
              case ThemeMode.dark:
                return ThemeCubit(const ThemeDark());
              default:
                return ThemeCubit(const ThemeSystem());
            }
          },
        ),
        BlocProvider<WelcomeCubit>(create: (context) => WelcomeCubit()),
      ],
      child: const RestoApp(),
    );
  }
}

class RestoApp extends StatelessWidget {
  const RestoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (_, state) {
        return ScreenUtilInit(
          designSize: const Size(390, 844), // based on Iphone 12 Pro
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'Dishes App',
              builder: EasyLoading.init(),
              debugShowCheckedModeBanner: false,
              theme: Theme.of(context).brightness == Brightness.dark
                  ? darkTheme()
                  : lightTheme(),
              onGenerateRoute: generateRoute,
              navigatorKey: locator<NavigationService>().navigationKey,
              home: const WelcomePage(),
            );
          },
        );
      },
    );
  }
}
