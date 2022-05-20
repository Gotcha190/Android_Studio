import 'package:flutter/material.dart';
import 'silnikQuizu.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizGame extends StatefulWidget {
  @override
  State<QuizGame> createState() => _QuizGameState();
}

//SilnikQuizu silnikQuizu = SilnikQuizu();
int nrPytania = 0;
int liczbaPytan = pytania.length;
int licznikPoprawnychOdpowiedzi = 0;
List<int> kolejnoscOdpowiedzi = [0, 1, 2, 3];
bool czyQuizZaliczony = false;
bool czyKoniecQuizu = false;
double wynikQuizu = 0;
List<bool> tablicaPoprawnychOdpowiedzi = [
  for (int i = 1; i <= liczbaPytan; i++) false
];
//List<Color> tablicaKolorow=[Colors.red,Colors.red,Colors.red];

class _QuizGameState extends State<QuizGame> {
  double wyznaczWynikQuizu() {
    setState(() {
      wynikQuizu = double.parse(
          (100 * licznikPoprawnychOdpowiedzi / liczbaPytan).toStringAsFixed(1));
    });
    wynikQuizu > 50 ? czyQuizZaliczony = true : czyQuizZaliczony = false;
    return wynikQuizu;
  }

  void losujOdpowiedzi() {
    //tablicaPoprawnychOdpowiedzi.length=3;
    kolejnoscOdpowiedzi.shuffle();
  }

  void nastepnePytanie() {
    print(nrPytania);
    losujOdpowiedzi();
    if (nrPytania == liczbaPytan - 1) {

      print('Koniec quizu');
      czyKoniecQuizu = true;
      wyznaczWynikQuizu();
      Alert(
        //closeIcon: Visibility(visible: false, child: Icon(Icons.play_arrow,)),
        //closeFunction: ,
          context: context,
          type: czyQuizZaliczony ? AlertType.success : AlertType.error,
          title: 'Koniec quizu',
          desc: 'Właśnie zakończyłeś quiz z wynikiem $wynikQuizu%',
          buttons: [
            DialogButton(
              width: 45,
              color: Colors.blue[100],
              onPressed: () {
                print('Na początek');
                setState(() {
                  nrPytania = 0;
                  Navigator.pop(context);
                  czyKoniecQuizu = false;
                });
              },
              child: const Text(
                'Na początek',
                style: TextStyle(fontSize: 15),
              ),
            ),
            DialogButton(
              color: Colors.blue[100],
              onPressed: () {
                print('Zakończ');
                Navigator.pop(context);
                setState(() {
                  czyKoniecQuizu=true;
                });
              },
              child: const Text(
                'Zakończ',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ]).show();
    } else {
      nrPytania++;
    }
  }

  void sprawdzOdpowiedzi(int wybor) {
    if (kolejnoscOdpowiedzi[wybor] == 0) {
      setState(() {
        tablicaPoprawnychOdpowiedzi[nrPytania] = true;
        licznikPoprawnychOdpowiedzi++;
        //tablicaKolorow[nrPytania]=Colors.green;
      });
    } else {
      setState(() {
        tablicaPoprawnychOdpowiedzi[nrPytania] = false;
        //tablicaKolorow[nrPytania]=Colors.red;
      });
    }
    print(
        'tablicaPoprawnychOdpowiedzi[$nrPytania]: ${tablicaPoprawnychOdpowiedzi[nrPytania]}');
  }

  @override
  void initState() {
    losujOdpowiedzi();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Game"),
      ),
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                // Pytanie
                czyKoniecQuizu ? (czyQuizZaliczony ? 'Gratulacje Twój wynik to $wynikQuizu%':'Twój wynik to $wynikQuizu%')
                : pytania[nrPytania].tytul,
                style: const TextStyle(fontSize: 40),
              ),
              Visibility(
                visible: !czyKoniecQuizu,
                child: MaterialButton(
                  // Odpowiedź 1
                  onPressed: () {
                    setState(() {
                      // print(pytania.length);
                      // print(pytania[nrPytania].odpowiedzi);
                      print(pytania[nrPytania].odpowiedzi.length);
                      print(pytania[nrPytania].tytul);
                      sprawdzOdpowiedzi(0);
                      nastepnePytanie();
                      //print('liczbaPytan: $liczbaPytan');
                    });
                  },
                  child: Text(
                    //pytania[nrPytania].odpowiedzi[0],
                    pytania[nrPytania].odpowiedzi[kolejnoscOdpowiedzi[0]],
                    style: const TextStyle(fontSize: 30),
                  ),
                  color: Colors.blue[100],
                ),
              ),
              Visibility(
                visible: !czyKoniecQuizu,
                child: MaterialButton(
                  // Odpowiedź 2
                  onPressed: () {
                    setState(() {
                      sprawdzOdpowiedzi(1);
                      nastepnePytanie();
                    });
                  },
                  child: Text(
                    pytania[nrPytania].odpowiedzi[kolejnoscOdpowiedzi[1]],
                    style: const TextStyle(fontSize: 30),
                  ),
                  color: Colors.blue[100],
                ),
              ),
              Visibility(
                visible: !czyKoniecQuizu,
                child: MaterialButton(
                  // Odpowiedź 3
                  onPressed: () {
                    setState(() {
                      sprawdzOdpowiedzi(2);
                      nastepnePytanie();
                    });
                  },
                  child: Text(
                    pytania[nrPytania].odpowiedzi[kolejnoscOdpowiedzi[2]],
                    style: const TextStyle(fontSize: 30),
                  ),
                  color: Colors.blue[100],
                ),
              ),
              Visibility(
                visible: !czyKoniecQuizu,
                child: MaterialButton(
                  // Odpowiedź 4
                  onPressed: () {
                    //for (int i = 0; i < 4; i++) print(kolejnoscOdpowiedzi[i]);
                    //print('----');
                    setState(() {
                      sprawdzOdpowiedzi(3);
                      nastepnePytanie();
                    });
                  },
                  child: Text(
                    pytania[nrPytania].odpowiedzi[kolejnoscOdpowiedzi[3]],
                    style: const TextStyle(fontSize: 30),
                  ),
                  color: Colors.blue[100],
                ),
              ),
              Visibility(
                visible: czyKoniecQuizu,
                child: MaterialButton(
                  // Koniec quizu
                  onPressed: () {
                    setState(() {
                      //sprawdzOdpowiedzi(1);
                      nrPytania=0;
                      czyKoniecQuizu=false;
                      licznikPoprawnychOdpowiedzi=0;
                    });
                  },
                  child: const Text("Koniec", style: TextStyle(fontSize: 30),
                  ),
                  color: Colors.blue[100],
                ),
              ),
              Row(
                children: [
                  //for (int i = 0; i <= ((nrPytania )==(liczbaPytan-1)?(nrPytania) : nrPytania-1); i++)
                  for (int i = 0; i <= nrPytania - (czyKoniecQuizu ? 0 :1); i++)
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / liczbaPytan,
                      color: tablicaPoprawnychOdpowiedzi[i] == true
                          ? Colors.green
                          : Colors.red,
                      //color: tablicaKolorow[i],
                    ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}
