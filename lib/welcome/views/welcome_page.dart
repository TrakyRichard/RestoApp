import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = '/welcome';
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: "Welcome"),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to the Restaurant App',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dishes');
                },
                child: const Text('Go to Dishes'),
              ),
            ],
          ),
        ));
  }
}
