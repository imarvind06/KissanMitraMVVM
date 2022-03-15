import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kissanmitra/utils/size_config.dart';
import 'package:kissanmitra/view_models/weather_view_model/weather_view_model.dart';

class TodaysWeatherView extends StatelessWidget {
  WeatherViewModel notifier;
  TodaysWeatherView(this.notifier, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Todays Weather",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  weatherWidget(notifier.getTodayWeathers[0]),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  weatherWidget(notifier.getTodayWeathers[1]),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  weatherWidget(notifier.getTodayWeathers[2]),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  weatherWidget(notifier.getTodayWeathers[3])
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "7 days Weather",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: getProportionateScreenHeight(25),
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget weatherWidget(todaysWeather) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius:
              BorderRadius.circular(getProportionateScreenHeight(35))),
      child: Column(
        children: [
          Text(
            todaysWeather.current.toString() + "\u00B0",
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: getProportionateScreenWidth(20)),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Image(
            image: AssetImage(todaysWeather.image),
            width: getProportionateScreenWidth(50),
            height: getProportionateScreenHeight(50),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Text(
            todaysWeather.time,
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: getProportionateScreenHeight(16),
                color: Colors.grey),
          )
        ],
      ),
    );
  }
}
