import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgeDetectorScreen extends StatefulWidget {
  const AgeDetectorScreen({Key? key}) : super(key: key);

  @override
  _AgeDetectorScreenState createState() => _AgeDetectorScreenState();
}

class _AgeDetectorScreenState extends State<AgeDetectorScreen> {
  final nameController = TextEditingController();
  int? age;
  String? ageGroup;
  String? imageAsset;

  Future<void> fetchAge() async {
    final name = nameController.text;
    final url = Uri.parse('https://api.agify.io/?name=$name');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        age = data['age'];
        if (age != null) {
          if (age! < 35) {
            ageGroup = 'Joven';
            imageAsset =
                'https://i.pinimg.com/originals/6c/50/fe/6c50fedcbd921cb0990e1abdc9c971d7.jpg';
          } else if (age! < 60) {
            ageGroup = 'Adulto';
            imageAsset =
                'https://thumbs.dreamstime.com/b/hombre-adulto-85525345.jpg';
          } else {
            ageGroup = 'Anciano';
            imageAsset =
                'https://img.freepik.com/vector-premium/dibujos-animados-feliz-senior-anciano-anciano_29190-4599.jpg';
          }
        } else {
          ageGroup = null;
          imageAsset = null;
        }
      });
    } else {
      throw Exception('Failed to fetch age');
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
      appBar: AppBar(
        title: const Text('Detector de Edades'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Introduzca su nombre:'),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                controller: nameController,
              ),
            ),
            ElevatedButton(
              onPressed: fetchAge,
              child: const Text('Detectar'),
            ),
            if (age != null)
              Column(
                children: [
                  Text(
                    'Tu tienes $age años',
                    style: const TextStyle(fontSize: 18),
                  ),
                  if (ageGroup != null && imageAsset != null)
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Tu grupo de edad: $ageGroup',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        Image.network(
                          imageAsset!,
                          width: 200,
                          height: 200,
                        ),
                      ],
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
