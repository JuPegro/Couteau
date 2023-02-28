import 'package:flutter/material.dart';
import 'package:rest_apis/screen/acerca.dart';
import 'package:rest_apis/screen/age.dart';
import 'package:rest_apis/screen/gender.dart';
import 'package:rest_apis/screen/home.dart';
import 'package:rest_apis/screen/universities.dart';
import 'package:rest_apis/screen/weather.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('JuPegro_'),
            accountEmail: const Text('20210228@itla.edu.do'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'img/Julio.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v1016-c-08_1-ksh6mza3.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f584d8501c27c5f649bc2cfce50705c0',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
            ),
            title: Text(
              'Home',
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const Home())));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite,
            ),
            title: Text(
              'Genero',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const GenderizeScreen())));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite,
            ),
            title: Text(
              'Edad',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const AgeDetectorScreen())));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite,
            ),
            title: Text(
              'Universidades',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => UniversitiesPage())));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite,
            ),
            title: Text(
              'Clima',
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => WeatherPage())));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite,
            ),
            title: Text(
              'Acerca de',
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const AcercaDe())));
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
