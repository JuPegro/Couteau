import 'package:flutter/material.dart';

import '../NavBar.dart';

void main() => runApp(const Home());

//VARIABLES DE INFORMACIÓN
var info = 'Esta aplicación tiene varias utilidades.';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.red,
      appBar: AppBar(
//        backgroundColor: Colors.transparent,
        backgroundColor: const Color(0x44000000),
        elevation: 0,
      ),
      body: Stack(
        children: [
          ..._buildBackground(context),
          _builderMovieInformation(context)
        ],
      ),
    );
  }

  Positioned _builderMovieInformation(BuildContext context) {
    return Positioned(
      bottom: 60,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: Column(
          children: [
            const Text(
              'Couteau',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              info,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackground(context) {
    return [
      Container(
        height: double.infinity,
        color: const Color.fromRGBO(201, 3, 20, 1),
      ),
      Image.asset(
        'img/Portada.jpg',
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
          child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Color.fromRGBO(255, 255, 255, 1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.6, 0.8])))),
    ];
  }
}
