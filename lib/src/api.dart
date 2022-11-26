import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Weather> fetchWeather() async {
  String cityCode = '3650472';
  String apiKey = '30aaf473d7598d187815c79711d19bf4';
  final response = await http.get(Uri.parse(
      // El codigo de la ciudad de Tulcan es 3650472 usado en la URL
      // Usamos la API de OpenWeatherMap
      'https://api.openweathermap.org/data/2.5/weather?id=$cityCode&appid=$apiKey&units=metric&lang=es'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load weather');
  }
}

class Weather {
  final String city;
  final String description;
  final double temperature;
  final int humidity;
  const Weather({
    required this.city,
    required this.description,
    required this.temperature,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'],
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
    );
  }
}
