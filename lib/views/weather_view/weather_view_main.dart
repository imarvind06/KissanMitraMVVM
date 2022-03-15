import 'package:flutter/material.dart';
import 'package:kissanmitra/utils/size_config.dart';
import 'package:kissanmitra/view_models/weather_view_model/weather_view_model.dart';
import 'package:kissanmitra/views/map_view/map_weather_view.dart';
import 'package:kissanmitra/views/weather_view/seven_day_view/seven_day_weather_view.dart';
import 'package:kissanmitra/views/weather_view/current_day_view/current_weather_view.dart';
import 'package:kissanmitra/views/weather_view/today_view/todays_weather_view.dart';
import 'package:provider/provider.dart';

class WeatherViewMain extends StatefulWidget {
  const WeatherViewMain({Key? key}) : super(key: key);

  @override
  State<WeatherViewMain> createState() => _WeatherViewMainState();
}

class _WeatherViewMainState extends State<WeatherViewMain> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<WeatherViewModel>().getData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const MapWeatherView(),
          ));
        },
        child: Icon(
          Icons.map,
          size: getProportionateScreenHeight(30),
          color: Colors.white,
        ),
      ),
      body: Consumer<WeatherViewModel>(
        builder: (context, notifier, child) {
          return (notifier.isLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CurrentWeatherView(notifier),
                      TodaysWeatherView(notifier),
                      SevenDaysView(notifier.getSevenDayWeathers)
                    ],
                  ),
                );
        },
      ),
    );
  }
}
