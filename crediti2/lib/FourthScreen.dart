import 'package:flutter/material.dart';
import 'costanti.dart';
import 'package:fl_chart/fl_chart.dart';

class FourthScreen extends StatefulWidget {
  FourthScreen({
    Key key, //this.title
  }) : super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
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
          child: ListView(children: [
            AspectRatio(
              aspectRatio: 1.1,
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
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'I Tuoi Voti',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 37,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 16.0, left: 6.0),
                            child: LineChart(
                              isShowingMainData ? sampleData1() : sampleData2(),
                              swapAnimationDuration:
                                  const Duration(milliseconds: 250),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.white
                            .withOpacity(isShowingMainData ? 1.0 : 0.5),
                      ),
                      onPressed: () {
                        setState(() {
                          isShowingMainData = !isShowingMainData;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Divider1,
            /*Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Text(
                "Riassuno",
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Table(
                // textDirection: TextDirection.rtl,
                // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                // border:TableBorder.all(width: 2.0,color: Colors.red),
                children: [
                  TableRow(children: [
                    Text(
                      "Voto",
                      textScaleFactor: 1.5,
                    ),
                    Text("Numero necessario", textScaleFactor: 1.5),
                  ]),
                  TableRow(children: [
                    Text("6", textScaleFactor: 1.5),
                    Text(df_1[0].toString(), textScaleFactor: 1.5),
                  ]),
                  TableRow(children: [
                    Text("7", textScaleFactor: 1.5),
                    Text(df_1[1].toString(), textScaleFactor: 1.5),
                  ]),
                  TableRow(children: [
                    Text("8", textScaleFactor: 1.5),
                    Text(df_1[2].toString(), textScaleFactor: 1.5),
                  ]),
                  TableRow(children: [
                    Text("9", textScaleFactor: 1.5),
                    Text(df_1[3].toString(), textScaleFactor: 1.5),
                  ]),
                  TableRow(children: [
                    Text("10", textScaleFactor: 1.5),
                    Text(df_1[4].toString(), textScaleFactor: 1.5),
                  ]),
                ],
              ),
            ),
            Divider1,
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Table(children: [
                TableRow(children: [
                  Text("Media:", textScaleFactor: 1.5),
                  Text(rispostaFinale['media'].toString().substring(0, 5),
                      textScaleFactor: 1.5),
                ]),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
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
                child: IconButton(
                  icon: Icon(Icons.subdirectory_arrow_right_outlined),
                  tooltip: 'Pagina successiva',
                  onPressed: () {
                    Navigator.pushNamed(context, '/fifth');
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

LineChartData sampleData1() {
  return LineChartData(
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
      touchCallback: (LineTouchResponse touchResponse) {},
      handleBuiltInTouches: true,
    ),
    gridData: FlGridData(
      show: true,
    ),
    titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        margin: 10,
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '6';
            case 4:
              return '7';
            case 7:
              return '8';
            case 10:
              return '9';
            case 13:
              return '10';
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '1';
            case 2:
              return '2';
            case 3:
              return '3';
            case 4:
              return '4';
            case 5:
              return '5';
            case 6:
              return '6';
          }
          return '';
        },
        margin: 8,
        reservedSize: 30,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(
          color: Color(0xff4e4965),
          width: 4,
        ),
        left: BorderSide(
          color: Colors.transparent,
        ),
        right: BorderSide(
          color: Colors.transparent,
        ),
        top: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    minX: 0,
    maxX: 14,
    maxY: 6,
    minY: 0,
    lineBarsData: linesBarData1(),
  );
}

List<LineChartBarData> linesBarData1() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(1, yNVOTI[0].toDouble()),
      FlSpot(4, yNVOTI[1].toDouble()),
      FlSpot(7, yNVOTI[2].toDouble()),
      FlSpot(10, yNVOTI[3].toDouble()),
      FlSpot(13, yNVOTI[4].toDouble()),
    ],
    isCurved: true,
    colors: [
      const Color(0xff27b6fc),
      const Color(0xffaa4cfc),
      const Color(0xff4af699),
    ],
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
    ),
  );

  // final LineChartBarData lineChartBarData2 = LineChartBarData(
  //   spots: [
  //     FlSpot(1, mediavecchia.toDouble()),
  //     FlSpot(3, mediavecchia),
  //     FlSpot(7, mediavecchia),
  //     FlSpot(10, mediavecchia),
  //     FlSpot(12, mediavecchia),
  //     FlSpot(13, mediavecchia),
  //   ],
  //   isCurved: true,
  //   colors: [
  //     const Color(0xffaa4cfc),
  //   ],
  //   barWidth: 8,
  //   isStrokeCapRound: true,
  //   dotData: FlDotData(
  //     show: false,
  //   ),
  //   belowBarData: BarAreaData(show: false, colors: [
  //     const Color(0x00aa4cfc),
  //   ]),
  // );
  final LineChartBarData lineChartBarData3 = LineChartBarData(
    spots: [
      FlSpot(1, mediaideale),
      FlSpot(3, mediaideale),
      FlSpot(6, mediaideale),
      FlSpot(10, mediaideale),
      FlSpot(13, mediaideale),
    ],
    isCurved: true,
    colors: const [
      Color(0xff27b6fc),
    ],
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
    ),
  );
  return [
    lineChartBarData1,
    //lineChartBarData2,
    //lineChartBarData3,
  ];
}

LineChartData sampleData2() {
  return LineChartData(
    lineTouchData: LineTouchData(
      enabled: false,
    ),
    gridData: FlGridData(
      show: true,
    ),
    titlesData: FlTitlesData(
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        margin: 10,
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '6';
            case 4:
              return '7';
            case 7:
              return '8';
            case 10:
              return '9';
            case 13:
              return '10';
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '1';
            case 2:
              return '2';
            case 3:
              return '3';
            case 4:
              return '4';
            case 5:
              return '5';
            case 6:
              return '6';
            case 7:
              return '7';
            case 8:
              return '8';
          }
          return '';
        },
        margin: 8,
        reservedSize: 30,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        )),
    minX: 0,
    maxX: 14,
    maxY: 6,
    minY: 0,
    lineBarsData: linesBarData2(),
  );
}

List<LineChartBarData> linesBarData2() {
  return [
    LineChartBarData(
      spots: [
        FlSpot(1, yNVOTI[0].toDouble()),
        FlSpot(4, yNVOTI[1].toDouble()),
        FlSpot(7, yNVOTI[2].toDouble()),
        FlSpot(10, yNVOTI[3].toDouble()),
        FlSpot(13, yNVOTI[4].toDouble()),
      ],
      isCurved: true,
      curveSmoothness: 0,
      colors: const [
        Color(0x444af699),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    ),
    LineChartBarData(
      spots: [
        FlSpot(1, yNVOTI[0].toDouble()),
        FlSpot(4, yNVOTI[1].toDouble()),
        FlSpot(7, yNVOTI[2].toDouble()),
        FlSpot(10, yNVOTI[3].toDouble()),
        FlSpot(13, yNVOTI[4].toDouble()),
      ],
      isCurved: true,
      curveSmoothness: 0,
      colors: const [
        Color(0x4427b6fc),
      ],
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(
        show: true,
      ),
    ),
  ];
}
