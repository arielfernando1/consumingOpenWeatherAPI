// Author: ariel593
// Este proyecto está basado en la documentación de flutter sobre como consumir una API
// https://flutter.dev/docs/cookbook/networking/fetch-data
// Es necesario añadir la dependencia http en el archivo pubspec.yaml o escribiendo en la terminal: flutter pub add http
import 'package:consuming_weather_api/src/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Consumir API de OpenWeatherMap'),
    );
  }
}
