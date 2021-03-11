import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'costanti.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  //int comportamento;

  void algoritmo_1() async {
    Map<String, String> data = {
      'school_code': codiceScuola,
      'username': username,
      'password': password,
      'materie': materie.toString(),
      'quadrimestre': quadrimestre1.toString(),
      'media': media.toString(),
      'cambiamenti': materieval.toString(),
      'comportamento': comportamento.toString(),
      'educazione_civica': educazioneCivica.toString(),
    };
    const url = 'https://liceoscacchi.herokuapp.com/';
    await http.post(url, body: data).then((response) {
      try {
        //_showaccettazionetermini();
        dati = response.body;
        dynamic res = jsonDecode(dati);
        dati2 = dati1[username];
      } catch (e) {
        errore = 'Non è stato possibile accedere ai tuoi dati $e';
        //_showRatingDialog();
        print(errore);
      }
    });
  }

  void _incrementCounter() {
    ottieniVoti();
    //algoritmo_1();
    Navigator.pushNamed(context, '/fourth');
  }

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
        child: ListView(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${materieDaVisualizzare[0]}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.orange,
                    value: materieval[0],
                    onChanged: (value) {
                      setState(() {
                        materieval[0] = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${materieDaVisualizzare[1]}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.orange,
                    value: materieval[1],
                    onChanged: (value) {
                      setState(() {
                        materieval[1] = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '${materieDaVisualizzare[2]}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Switch(
                      inactiveThumbColor: Colors.red,
                      activeColor: Colors.orange,
                      value: materieval[2],
                      onChanged: (value) {
                        setState(() {
                          materieval[2] = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    '${materieDaVisualizzare[3]}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.orange,
                    value: materieval[3],
                    onChanged: (value) {
                      setState(() {
                        materieval[3] = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    '${materieDaVisualizzare[4]}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.orange,
                    value: materieval[4],
                    onChanged: (value) {
                      setState(() {
                        materieval[4] = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${materieDaVisualizzare[5]}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.orange,
                    value: materieval[5],
                    onChanged: (value) {
                      setState(() {
                        materieval[5] = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${materieDaVisualizzare[6]}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.orange,
                    value: materieval[6],
                    onChanged: (value) {
                      setState(() {
                        materieval[6] = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${materieDaVisualizzare[7]}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.orange,
                    value: materieval[7],
                    onChanged: (value) {
                      setState(() {
                        materieval[7] = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${materieDaVisualizzare[8]}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.orange,
                    value: materieval[8],
                    onChanged: (value) {
                      setState(() {
                        materieval[8] = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('${materieDaVisualizzare[9]}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  Switch(
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.orange,
                    value: materieval[9],
                    onChanged: (value) {
                      setState(() {
                        materieval[9] = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 80.0, vertical: 15.0),
                      child: FlatButton(
                        onPressed: _incrementCounter,
                        child: Text(
                          "Calcola",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Colors.orange,
                        textColor: Colors.black,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.black,
                        hoverColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
