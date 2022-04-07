import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_size_getter/image_size_getter.dart';
import 'package:image_size_getter/file_input.dart';

final List<String> headImg = [
  'images/glowa1.png',
  'images/glowa2.png',
  'images/glowa3.png',
];

final List<String> bodyImg = [
  'images/tulow1.png',
  'images/tulow2.png',
  'images/tulow3.png',
];

final List<String> legImg = [
  'images/nogi1.png',
  'images/nogi2.png',
  'images/nogi3.png',
];

void main() => runApp(MyApp());

final themeMode = ValueNotifier(2);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          initialRoute: '/',
          title: 'Przebieranki',
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.values.toList()[value as int],
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (ctx) => MyHomePage(),
            '/carouselDemo': (ctx) => CarouselDemo(),
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
        title: Text('Main App TEST tittle'),
        actions: [
          IconButton(
              icon: Icon(Icons.nightlight_round),
              onPressed: () {
                themeMode.value = themeMode.value == 1 ? 2 : 1;
              })
        ], //actions
      ),
      body: ListView(
        children: <Widget>[
          DemoItem('Carousel Demo', '/carouselDemo'),
          DemoItem('TEST2', '/')
        ],
      ),
    );
  } // <Widget> []
} // Class

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image slider demo')),
      body: Column(
        children: <Widget>[
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 105
              ),
              items: headImg
                  .map(
                    (item) => Container(
                      child: Center(
                          child: Image.asset(item, width: 1000 )),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 73
              ),
              items: bodyImg
                  .map(
                    (item) => Container(
                  child: Center(
                      child: Image.asset(item, width: 1000)),
                ),
              )
                  .toList(),
            ),
          ),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 105
              ),
              items: legImg
                  .map(
                    (item) => Container(
                  child: Center(
                      child: Image.asset(item, width: 1000)),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

