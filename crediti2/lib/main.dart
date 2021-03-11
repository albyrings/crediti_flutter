import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'costanti.dart';
import 'ThirdScreen.dart';
import 'FourthScreen.dart';
import 'loadingScreen.dart';
import 'FifthScreen.dart';
import 'MyHomePage.dart';
import "terminid'utilizzo.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do less, take more',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
        accentColor: Colors.orange,
      ),
      initialRoute: '/fourth',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        //'/': (context) => LoadingScreen(),
        '/homeq': (context) => MyHomePage(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/fourth': (context) => FourthScreen(),
        '/fifth': (context) => FifthScreen(),
        '/termini': (context) => TerminiScreen(),
      },
    );
  }
}
