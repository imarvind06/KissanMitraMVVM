import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kissanmitra/services/weather_service/weather_services.dart';
import 'package:kissanmitra/utils/size_config.dart';
import 'package:kissanmitra/view_models/weather_view_model/weather_view_model.dart';
import 'package:kissanmitra/views/weather_view/weather_view_main.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KissanMitra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => WeatherViewModel(WeatherService()),
        child: const SafeArea(child: WeatherViewMain()),
      ),
    );
  }
}
