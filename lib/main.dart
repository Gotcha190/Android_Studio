import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_size_getter/image_size_getter.dart';
import 'package:image_size_getter/file_input.dart';
import 'CarouselDemo.dart';
import 'Pianino.dart';
import 'TextGame/TextGame.dart';

void main() => runApp(MyApp());

final themeMode = ValueNotifier(2);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          title: 'MAIN APP',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => MyHomePage(),
            '/carouselDemo': (ctx) => CarouselDemo(),
            '/pianino': (ctx) => Pianino(),
            '/TextGame/textGame': (ctx) => TextGame(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  DemoItem(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main App'),
        actions: [
          IconButton(
              icon: const Icon(Icons.nightlight_round),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ], //actions
      ),
      body: ListView(
        children: <Widget>[
          DemoItem('Carousel Demo', '/carouselDemo'),
          DemoItem('Pianino', '/pianino'),
          DemoItem('Text Game','/TextGame/textGame'),
        ],
      ),
    );
  } // <Widget> []
} // Class

