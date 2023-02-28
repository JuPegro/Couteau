import 'package:flutter/material.dart';

import '../NavBar.dart';

class AcercaDe extends StatelessWidget {
  const AcercaDe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.red,
      appBar: AppBar(
//        backgroundColor: Colors.transparent,
        title: const Text('Acerca de...'),
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
      bottom: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Julio M. Peguero',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'majr1940@gmail.com',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
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
        'img/Julio.jpg',
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.78,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
          child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Color.fromRGBO(0, 0, 0, 1)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.4, 0.7])))),
    ];
  }
}
