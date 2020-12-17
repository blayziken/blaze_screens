import 'package:blaze_screens/Screens/Fruity.dart';
import 'package:flutter/material.dart';
import 'package:blaze_screens/Screens/Reddish.dart';
import 'package:blaze_screens/Screens/Glow.dart';
import './Screens/BlueRoll.dart';
import './Screens/Yellow.dart';
import './Screens/Aboard.dart';
import './Screens/TC.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blaze Screens',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
//        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TC(),
      routes: {
        ReddishScreen.routeName: (context) => ReddishScreen(),
        GlowScreen.routeName: (context) => GlowScreen(),
        BlueRoll.routeName: (context) => BlueRoll(),
        Fruity.routeName: (context) => Fruity(),
        Yellow.routeName: (context) => Yellow(),
        Aboard.routeName: (context) => Aboard(),
        TC.routeName: (context) => TC()
      },
    );
  }
}
