import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

Audio audioLoop = Audio.load('assets/bells.mp3', looping: true, playInBackground: true);
bool audiostatus = false;
String text = "Loop";

class Pianino extends StatefulWidget {
  @override
  State<Pianino> createState() => _PianinoState();
}

class _PianinoState extends State<Pianino> {


  Expanded Klawisz({required int nrKlawisza}) {
    return Expanded(
      child: Container(
        child: MaterialButton(
          onPressed: () {
            Audio.load('assets/note$nrKlawisza.wav')..play()..dispose();
          },
          color: Colors.yellow[nrKlawisza * 100 + 200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Klawisz nr: $nrKlawisza')],
          ),
        ),
      ),
      flex: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pianino')),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      audiostatus =! audiostatus;
                    });
                    if(audiostatus == true){
                      audioLoop.play();
                      text = "Play";
                    }else {
                      audioLoop.pause();
                      text = "Pause";
                    }
                  },
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(text)],
                  ),
                ),
              ),
              flex: 1,
            ),
            for (int i = 1; i <= 7; i++) Klawisz(nrKlawisza: i),
          ],
        ),
      ),
    );
  }
}
