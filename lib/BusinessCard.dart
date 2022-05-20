import 'package:flutter/material.dart';

class BusinessCard extends StatefulWidget {
  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Business card')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.green[100],
                radius: 100,
                backgroundImage: NetworkImage('https://cdn4.vectorstock.com/i/1000x1000/17/53/dj-avatar-playing-music-graphic-vector-9421753.jpg'),
              ),
              const Text('Konrad Formella', style: TextStyle(fontSize: 50, fontFamily: 'MySoul')),
              const Text('Student', style: TextStyle(fontSize: 30, fontFamily: 'MySoul')),
              const Text('Akademia Pomorska w Słupsku', style: TextStyle(fontSize: 30, fontFamily: 'MySoul')),
              const Text('Telefon: +48 506 666 038', style: TextStyle(fontSize: 30, fontFamily: 'MySoul')),
            ]),
      ),
    );
  }
}
