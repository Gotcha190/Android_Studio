import 'package:flutter/material.dart';
import 'TextGameEngine.dart';

class TextGame extends StatefulWidget {
  @override
  State<TextGame> createState() => _TextGameState();
}

class _TextGameState extends State<TextGame> {
  Engine engine = Engine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Game')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(
                    engine.getDesc(),
                    style: const TextStyle(fontSize: 40)),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    engine.nextStage(1);
                  });
                },
                child:
                  Text(engine.getChoice($i: 1), style: const TextStyle(fontSize: 30)),
                color: Colors.green[100],
              ),
              Visibility(
                visible: !engine.storyEnd,
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      engine.nextStage(2);
                    });
                  },
                  child: Text(engine.getChoice($i: 2), style: const TextStyle(fontSize: 30)),
                  color: Colors.green[100],
                ),
              ),
            ]),
      ),
    );
  }
}