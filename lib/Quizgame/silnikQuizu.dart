import 'package:flutter/material.dart';

class Pytanie {
  String tytul;
  List<String> odpowiedzi;
  Pytanie({required this.tytul, required this.odpowiedzi}) {}
}

List<Pytanie> pytania = [
  Pytanie(
      tytul: 'Które miasto jest stolicą Polski?',
      odpowiedzi: ['Warszawa', 'Kraków', 'Wrocław', 'Gniezno']),
  Pytanie(tytul: 'Kto był pierwszym władcą Polski?', odpowiedzi: [
    'Mieszko I',
    'Bolesław Chrobry',
    'Kazimierz Wielki',
    'Stanisław Poniatowski'
  ]),
  Pytanie(
      tytul: 'Ile nóg mają pajęczaki?',
      odpowiedzi: ['8', '4', '6', 'Zależy od gatunku']),
  Pytanie(
      tytul: '2+2*2 =',
      odpowiedzi: ['6', '4', '8', '10']),
];