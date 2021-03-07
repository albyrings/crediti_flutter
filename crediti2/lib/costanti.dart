String codiceScuola = 'ss16765';
String username;
String password;
bool accettazione_termini = false;
String religione = 'RELIGIONE CATTOLICA';
double comportamento = 9;
double quadrimestre = 2;
int quadrimestre1 = quadrimestre.toInt();
double educazioneCivica = 8;
double media = 6.1;
List<String> materie = [];
List<String> materieDaVisualizzare = [];
List<bool> materieval = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
List<int> lista;
List<int> voti;
String errore = 'errore';
dynamic dati;
Map dati1;
List dati2;

void ottieniMaterie() {
  List a_1 = dati2;
  int L = a_1.length;
  for (int i = 0; i < L; i++) {
    String mat = a_1[i]['desMateria'];
    bool magic = !materie.contains(mat);
    if (magic && mat != religione) {
      materie.add(mat);
      if (mat.length > 20) {
        mat = mat.substring(0, 18);
      }
      materieDaVisualizzare.add(mat);
    }
  }
}

Map<String, List<double>> voti_3 = {
  materie[0]: [],
  materie[1]: [],
  materie[2]: [],
  materie[3]: [],
  materie[4]: [],
  materie[5]: [],
  materie[6]: [],
  materie[7]: [],
  materie[8]: [],
  materie[9]: [],
  materie[10]: []
};

void ottieniVoti() {
  List a_1 = dati2;
  int L = a_1.length;
  int c = 0;
  for (String j in materie) {
    for (int i = 0; i < L; i++) {
      if (a_1[i]['datGiorno'][5] == '0' || a_1[i]['datGiorno'][5] == '1') {
        if (a_1[i]['desMateria'] == j) {
          var tru = a_1[i]['decValore'];
          double tru1 = double.parse(tru);
          if (tru1 != null && tru1 != 0.0) {
            try {
              voti_3[j].add(tru1);
            } catch (e) {}
          } else {
            c += 0;
          }
        }
      }
    }
  }
}

void algoritmo1() {
  dynamic a_1 = dati2;
  int L = a_1.length;

  int c = 0;
  int comportamento = 10;
  String religione = 'RELIGIONE CATTOLICA';
  try {
    for (String j in materie) {
      for (int i = 0; i < L; i++) {
        if (a_1[i]['datGiorno'][5] == '0') {
          // if (a_1[i]['datGiorno'][6] == '2' ||
          //     a_1[i]['datGiorno'][6] == '3' ||
          //     a_1[i]['datGiorno'][6] == '4' ||
          //     a_1[i]['datGiorno'][6] == '5' ||
          //     a_1[i]['datGiorno'][6] == '6') {
          if (a_1[i]['desMateria'] == j) {
            var tru = a_1[i]['decValore'];
// questa funzione accerta che i dati sono validi (data cleaning)
//aggiorna in base all'api
            double tru1 = double.parse(tru);
            if (tru1 != null && tru1 != 0.00) {
              voti_3[j].add(tru1);
              //name1.add(tru1);
            } else {
              c += 0;
            }
            // } else {
            //   c += 0;
            // }
          }
        }
      }
    }

    List<int> medie = [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      comportamento,
      educazioneCivica.toInt()
    ];

    int mi = -1;
    List m1;
    int m2;
    var m4;
    var m5;

//calcolo della media dai voti
    for (String j in materie) {
      mi = mi + 1;
      m1 = voti_3[j];
      m2 = m1 != null ? m1.length : 0;
      m4 = 0;
      for (int m3 = 0; m3 < m2; m3++) {
        m4 += m1[m3];
      }
      if (m2 != 0) {
        m5 = m4 / m2;
      }
      medie[mi] = m5.round().toInt();
    }

//algoritmo di calcolo
    List<int> materiaval;
    voti = medie;
    int s_voti = 0;

    for (int j in voti) {
      s_voti = s_voti + voti[j];
    }

    var media = s_voti / voti.length;
//mm3 è la media obiettivo da prendere dai file precedenti
    double mm3 = 9.0;
    int k = 0;
    bool whi = true;
//prova a mettere whi in modo esplicito nella condizione del while togliendo l'operatore ternario
    whi = media < mm3 ? true : false;
    while (whi) {
      if (materiaval[k] == 1) {
        voti[k] = voti[k] + 1;
      }

      int s_voti = 0;
      for (int j in voti) {
        s_voti = s_voti + voti[j];
      }
      media = s_voti / voti.length;
      whi = media < mm3 ? true : false;
      k = k + 1;
    }

//calcolo voti necessari
    dynamic n6 = 0;
    dynamic n7 = 0;
    dynamic n8 = 0;
    dynamic n9 = 0;
    dynamic n10 = 0;
    for (int i = 0; i < voti.length; i++) {
      if (voti[i] == 6) {
        n6 = n6 + 1;
      } else if (voti[i] == 7) {
        n7 = n7 + 1;
      } else if (voti[i] == 8) {
        n8 = n8 + 1;
      } else if (voti[i] == 9) {
        n9 = n9 + 1;
      } else if (voti[i] == 10) {
        n10 = n10 + 1;
      }
    }
    lista = [n6, n7, n8, n9, n10];

    //TODO: VEDI ALGORITMO soprattutto voti
  } catch (e) {
    //q print(e);
  }
}

List<dynamic> yNVOTI = [0.0, 1.0, 7.0, 2.0, 2.0];
dynamic mediavecchia = 9.1;
dynamic mediaideale = 9.8;
