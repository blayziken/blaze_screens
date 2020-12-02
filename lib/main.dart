import 'package:flutter/material.dart';
import 'package:blaze_screens/Screens/Reddish.dart';
import 'package:blaze_screens/Screens/Glow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GlowScreen(),
      routes: {
        ReddishScreen.routeName: (context) => ReddishScreen(),
        GlowScreen.routeName: (context) => GlowScreen(),
      },
    );
  }
}
