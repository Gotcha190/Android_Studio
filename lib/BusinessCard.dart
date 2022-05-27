import 'package:flutter/material.dart';

const double dataFontSize = 25;
const Color showColor = Color.fromRGBO(55, 103, 237, 100);
class BusinessCard extends StatefulWidget {
  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Business card')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: deviceData.size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[100],
                            radius: 100,
                            backgroundImage: const NetworkImage('https://cdn4.vectorstock.com/i/1000x1000/17/53/dj-avatar-playing-music-graphic-vector-9421753.jpg'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: deviceData.size.width,child: const Text('Konrad Formella', textAlign: TextAlign.center, style: TextStyle(fontSize: 50, fontFamily: 'MySoul'))),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2,color: showColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: deviceData.size.width * 0.2,child: const Icon(Icons.work, color: showColor)),
                    SizedBox(width: deviceData.size.width * 0.8,child: const Text('Student', style: TextStyle(fontSize: dataFontSize, fontFamily: 'MySoul'))),
                  ],
                ),
                const Divider(thickness: 2,color: showColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    SizedBox(width: deviceData.size.width * 0.2,child: const Icon(Icons.school, color: showColor)),
                    SizedBox(width: deviceData.size.width * 0.8,child: const Text('Akademia Pomorska w Słupsku', style: TextStyle(fontSize: dataFontSize, fontFamily: 'MySoul'))),
                  ],
                ),
                const Divider(thickness: 2,color: showColor),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: deviceData.size.width * 0.2,child: const Icon(Icons.phone, color: showColor)),
                      SizedBox(width: deviceData.size.width * 0.8,child: const Text('+48 506 666 038', style: TextStyle(fontSize: dataFontSize, fontFamily: 'MySoul'))),
                    ],
                  ),
                const Divider(thickness: 2,color: showColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: deviceData.size.width * 0.2,child: const Icon(Icons.email, color: showColor)),
                    SizedBox(width: deviceData.size.width * 0.8,child: const Text('konradformella190@gmail.com', style: TextStyle(fontSize: dataFontSize, fontFamily: 'MySoul'))),
                  ],
                ),
                const Divider(thickness: 2,color: showColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(width: deviceData.size.width * 0.2,child: const Icon(Icons.question_mark, color: showColor)),
                    SizedBox(width: deviceData.size.width * 0.8,child: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc rhoncus pulvinar augue ut efficitur. Quisque vitae urna ultrices nunc venenatis convallis dapibus id nibh. Suspendisse euismod est libero, at auctor ante facilisis non. Integer egestas quam in fringilla elementum. Donec ac turpis ac orci auctor volutpat ut et urna. Sed tincidunt auctor massa, eget ullamcorper dui auctor faucibus. Phasellus eget ante eu sem suscipit tempor. Nam vitae metus neque. Quisque imperdiet efficitur arcu, a tincidunt justo sagittis vel.Nulla dictum erat lorem, vitae viverra nisi fermentum nec. Suspendisse ut dignissim odio. Praesent placerat arcu congue libero ultrices, a consequat velit faucibus. Etiam consectetur arcu eu interdum porttitor. Proin non augue quis metus eleifend dapibus. Proin posuere libero vel egestas finibus. In tincidunt mauris turpis. Sed ac maximus enim. Phasellus a leo rhoncus, viverra ante ac, aliquam mauris. Fusce molestie aliquam turpis vitae efficitur. Pellentesque pharetra odio velit, sit amet iaculis arcu ornare et. Maecenas ac semper eros. In vel enim at metus fermentum suscipit quis id justo. Mauris a efficitur nulla, at egestas justo. Donec in magna a dolor mattis fermentum. ', style: TextStyle(fontSize: dataFontSize, fontFamily: 'MySoul'))),
                  ],
                ),

              ]),
        ),
      ),
    );
  }
}
