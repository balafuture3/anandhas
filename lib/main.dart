import 'package:anandhasapp/Screens/Dashboard.dart';
import 'package:anandhasapp/Screens/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color =
    {
      50:Color.fromRGBO(51,155,111, .1),
      100:Color.fromRGBO(51,155,111, .2),
      200:Color.fromRGBO(51,155,111, .3),
      300:Color.fromRGBO(51,155,111, .4),
      400:Color.fromRGBO(51,155,111, .5),
      500:Color.fromRGBO(51,155,111, .6),
      600:Color.fromRGBO(51,155,111, .7),
      700:Color.fromRGBO(51,155,111, .8),
      800:Color.fromRGBO(51,155,111, .9),
      900:Color.fromRGBO(51,155,111, 1),
    };
    MaterialColor colorCustom = MaterialColor(0xFF339B6F, color);
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: colorCustom,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

