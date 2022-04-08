import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

class Pianino extends StatelessWidget {
  Expanded Klawisz({required int nrKlawisza}) {
    return Expanded(
      child: Container(
        child: MaterialButton(
          onPressed: () {
            Audio audio = Audio.load('assets/note$nrKlawisza.wav');
            audio.play();
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
bool audiostatus = false;
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
                    Audio audio = Audio.load('assets/bells.mp3', looping: true, playInBackground: true);
                    audiostatus = !audiostatus;
                    if(audiostatus == true){
                      audio.play();
                    }else {
                      audio.pause();
                    }
                  },
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Loop')],
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
