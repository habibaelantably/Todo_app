import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/layouts/Counter/counter_Screen.dart';
import 'package:todo/layouts/Home/homeScreen.dart';
import 'package:todo/shared/bloc_observer.dart';

import 'Other small apps/FirstScreenChallenge.dart';
import 'Other small apps/animated.dart';
import 'Other small apps/challengeLayout.dart';
import 'Other small apps/easeanimation.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),


      home: homeScreen(),
    );
  }
}





