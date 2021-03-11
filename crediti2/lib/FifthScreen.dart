import 'package:flutter/material.dart';
import 'costanti.dart';

class FifthScreen extends StatefulWidget {
  FifthScreen({
    Key key, //this.title
  }) : super(key: key);

  @override
  _FifthScreenState createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  void _goBack() => Navigator.pop(context);

  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Do less, take more',
      //     style: TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
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
              AspectRatio(
                aspectRatio: 0.5,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff2c274c),
                        Color(0xff46426c),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(
                              height: 37,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Table(
                                // textDirection: TextDirection.rtl,
                                // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                // border:TableBorder.all(width: 2.0,color: Colors.red),
                                children: [
                                  TableRow(children: [
                                    Text(
                                      "Materia",
                                      textScaleFactor: 1.5,
                                    ),
                                    Text("Voto necessario",
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[0], textScaleFactor: 1.5),
                                    Text(voti23[0].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[1], textScaleFactor: 1.5),
                                    Text(voti23[1].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[2], textScaleFactor: 1.5),
                                    Text(voti23[2].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[3], textScaleFactor: 1.5),
                                    Text(voti23[3].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[4], textScaleFactor: 1.5),
                                    Text(voti23[4].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[5], textScaleFactor: 1.5),
                                    Text(voti23[5].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[6], textScaleFactor: 1.5),
                                    Text(voti23[6].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[7], textScaleFactor: 1.5),
                                    Text(voti23[7].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[8], textScaleFactor: 1.5),
                                    Text(voti23[8].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                  TableRow(children: [
                                    Text(materie23[9], textScaleFactor: 1.5),
                                    Text(voti23[9].toString(),
                                        textScaleFactor: 1.5),
                                  ]),
                                ],
                              ),
                            ),
                            //Divider1,
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
