import 'package:flutter/material.dart';
import 'costanti.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({
    Key key, //this.title
  }) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  void _setvalue(double value) => setState(() => media = value);
  void _setvaluec(double value) => setState(() => comportamento = value);
  void _setvalueec(double value) => setState(() => educazioneCivica = value);
  void _setvalueq(double value) => setState(() => quadrimestre = value);

  final myControllerU = TextEditingController();
  final myControllerP = TextEditingController();

  void _incrementCounter() {
    setState(() {
      try {
        if (materieDaVisualizzare != null) {
          Navigator.pushNamed(context, '/third');
        }
      } catch (e) {
        Navigator.pushNamed(context, '/error');
      }
    });
  }

  @override
  void dispose() {
    myControllerU.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.black],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text('Che media vuoi raggiungere?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Slider(
                      value: media,
                      onChanged: _setvalue,
                      min: 6.0,
                      max: 10.0,
                      divisions: 40,
                      activeColor: Colors.orange,
                      inactiveColor: Colors.black,
                      label: '${media}'),
                ),
              ],
            ),
            Column(
              children: [
                Text('Comportamento',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Slider(
                    value: comportamento,
                    onChanged: _setvaluec,
                    min: 6.0,
                    max: 10.0,
                    divisions: 4,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.black,
                    label: '${comportamento}',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('Educazione civica',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Slider(
                    value: educazioneCivica,
                    onChanged: _setvalueec,
                    min: 6.0,
                    max: 10.0,
                    divisions: 4,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.black,
                    label: '${educazioneCivica}',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text('Quadrimestre',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Slider(
                    value: quadrimestre,
                    onChanged: _setvalueq,
                    min: 1.0,
                    max: 2.0,
                    divisions: 1,
                    activeColor: Colors.orange,
                    inactiveColor: Colors.black,
                    label: '${quadrimestre}',
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: FlatButton(
                      onPressed: _incrementCounter,
                      child: Text(
                        "Continua",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.orange[400],
                      textColor: Colors.black,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.grey,
                      hoverColor: Colors.grey,
                      shape: StadiumBorder(
                          side: BorderSide(color: Colors.teal, width: 2)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
