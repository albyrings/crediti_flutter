// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'costanti.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';

SharedPreferences localStorage;

class LoadingScreen extends StatefulWidget {
  LoadingScreen({
    Key key, //this.title
  }) : super(key: key);

  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void gogo() {
    if (username == null) {
      //if (accettazione_termini == false) {
      _showaccettazionetermini();
      //}

    } else {
      Navigator.pushNamed(context, '/second');
    }
  }

  void _showaccettazionetermini() async {
    await animated_dialog_box.showInOutDailog(
        title: Center(
            child: Text(
                "Per continuare devi accettare i termini di servizio!")), // IF YOU WANT TO ADD
        context: context,
        firstButton: Center(
          widthFactor: 50.0,
          child: MaterialButton(
            // FIRST BUTTON IS REQUIRED
            elevation: 900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            color: Colors.orange,
            child: Text('Continua'),
            onPressed: () {
              accettazione_termini = true;
              // localStorage.setBool('accettazione_termini', accettazione_termini);
              Navigator.pushNamed(context, '/homeq');
            },
          ),
        ),
        secondButton: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          color: Colors.orange,
          child: Text('Leggi i termini'),
          onPressed: () {
            Navigator.pushNamed(context, '/termini');
          },
        ),
        icon: Icon(
          Icons.info_outline,
          color: Colors.red,
        ), // IF YOU WANT TO ADD ICON
        yourWidget: Container(
          child: Text(
            'Termini di servizio',
          ),
        ));
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      codiceScuola = prefs.getString('nome_utente');
      username = prefs.getString('username');
      password = prefs.getString('password');
      accettazione_termini = prefs.getBool('accettazione_termini');
      gogo();
    });
  }

  void initState() {
    getStringValuesSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _showaccettazionetermini();
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.black],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
