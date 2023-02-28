import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _cityName = 'Santo Domingo';
  String _weatherDescription = 'N/A';
  double _temperature = 0.0;

  Future<void> _getWeather() async {
    final apiKey = '1fcbb9d84754539ceb0045c9dbd1b844';
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$_cityName&units=metric&appid=$apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _weatherDescription = data['weather'][0]['description'];
        _temperature = data['main']['temp'];
      });
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    _getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _cityName,
              style: TextStyle(fontSize: 32.0),
            ),
            SizedBox(height: 16.0),
            Text(
              _weatherDescription,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              '${_temperature.toStringAsFixed(1)} °C',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
