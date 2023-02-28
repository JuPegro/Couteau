import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rest_apis/NavBar.dart';

class GenderizeScreen extends StatefulWidget {
  const GenderizeScreen({Key? key}) : super(key: key);

  @override
  _GenderizeScreenState createState() => _GenderizeScreenState();
}

class _GenderizeScreenState extends State<GenderizeScreen> {
  final nameController = TextEditingController();
  String? gender;

  Future<void> fetchGender() async {
    final name = nameController.text;
    final url = Uri.parse('https://api.genderize.io/?name=$name');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        gender = data['gender'];
      });
    } else {
      throw Exception('Failed to fetch gender');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Detector de Genero'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Introduce tu nombre:'),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: nameController,
              ),
            ),
            ElevatedButton(
              onPressed: fetchGender,
              child: const Text('Verificar'),
            ),
            if (gender != null)
              Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.asset(
                    gender == 'male' ? 'img/masculino.png' : 'img/femenino.png',
                    height: 100,
                    width: 100,
                  )),
          ],
        ),
      ),
    );
  }
}
