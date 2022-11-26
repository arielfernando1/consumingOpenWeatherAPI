import 'package:consuming_weather_api/src/api.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Weather>? _weather;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Weather>(
          future: fetchWeather(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //return renderWeather(snapshot.data);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.cloud,
                    size: 150.0,
                    // Si la tempeatura es mayor a 25 grados entonces el color del icono será rojo
                    // Caso contrario será azul
                    color: snapshot.data!.temperature > 25
                        ? Colors.red
                        : Colors.blue,
                  ),
                  Text(
                    snapshot.data!.city,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    snapshot.data!.description,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    '${snapshot.data!.temperature.toString()} °C',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  // himidity with icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.water_drop),
                      Text(
                        '${snapshot.data!.humidity.toString()} %',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
