import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UniversitiesPage extends StatefulWidget {
  @override
  _UniversitiesPageState createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  String _country = '';
  List _universities = [];

  Future<void> _getUniversities() async {
    final response = await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=${Uri.encodeFull(_country)}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _universities = data;
      });
    } else {
      throw Exception('Failed to fetch universities');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universidades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _country = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Pais',
                hintText: 'Introduzca el pais',
              ),
            ),
            ElevatedButton(
              onPressed: _getUniversities,
              child: Text('Buscar'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _universities.length,
                itemBuilder: (context, index) {
                  final university = _universities[index];
                  return Card(
                    child: ListTile(
                      title: Text(university['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dominio: ${university['domains'][0]}'),
                          Text('Pagina web: ${university['web_pages'][0]}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
