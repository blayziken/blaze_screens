import 'package:flutter/material.dart';
import 'package:blaze_screens/Screens/Reddish.dart';
import 'package:blaze_screens/Screens/Glow.dart';
import './Screens/BlueRoll.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blaze Screens',
      theme: ThemeData(
//        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlueRoll(),
      routes: {
        ReddishScreen.routeName: (context) => ReddishScreen(),
        GlowScreen.routeName: (context) => GlowScreen(),
        BlueRoll.routeName: (context) => BlueRoll(),
      },
    );
  }
}
