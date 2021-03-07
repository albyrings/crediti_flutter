import 'package:flutter/material.dart';
import 'costanti.dart';

class TerminiScreen extends StatefulWidget {
  TerminiScreen({
    Key key, //this.title
  }) : super(key: key);

  @override
  _TerminiScreenState createState() => _TerminiScreenState();
}

class _TerminiScreenState extends State<TerminiScreen> {
  void _goBack() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.black],
          ),
        ),
        child: Center(
          child: ListView(children: [
            Text('la vita fa tic tac la vita dfa tic tac'),
            //Text("voti".toString())
          ]),
        ),
      ),
    );
  }
}
