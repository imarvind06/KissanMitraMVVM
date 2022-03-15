import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kissanmitra/utils/constants.dart';
import 'package:kissanmitra/utils/size_config.dart';
import 'package:kissanmitra/view_models/weather_view_model/weather_view_model.dart';

class CurrentWeatherView extends StatelessWidget {
  WeatherViewModel notifier;
  CurrentWeatherView(this.notifier, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: getProportionateScreenHeight(550),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(getProportionateScreenWidth(50)),
              bottomRight: Radius.circular(getProportionateScreenWidth(50)))),
      child: Column(
        children: [
          maindata(),
          const Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          extraData(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
        ],
      ),
    );
  }

  Widget maindata() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    "lat :${lat.toString().substring(0, 5)}, lon :${lon.toString().substring(0, 5)}",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: getProportionateScreenHeight(10),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Image(
          image: AssetImage(notifier.getCurrentWeather.image),
          width: getProportionateScreenWidth(300),
          height: getProportionateScreenHeight(300),
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
              child: Column(
            children: [
              Text(
                notifier.getCurrentWeather.current.toString() /* + "\u00B0"*/,
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    height: 0.1,
                    fontSize: getProportionateScreenHeight(120),
                    fontWeight: FontWeight.bold),
              ),
              Text(notifier.getCurrentWeather.name,
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: getProportionateScreenHeight(25),
                  )),
              Text(
                notifier.getCurrentWeather.day,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: getProportionateScreenHeight(18),
                ),
              ),
            ],
          )),
        )
      ],
    );
  }

  Widget extraData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              notifier.getCurrentWeather.wind.toString() + " Km/h",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenHeight(16)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Wind",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black54,
                fontSize: getProportionateScreenHeight(16),
              ),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.drop,
              color: Colors.white,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              notifier.getCurrentWeather.humidity.toString() + " %",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenHeight(16)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Humidity",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black54,
                  fontSize: getProportionateScreenHeight(16)),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              CupertinoIcons.cloud_rain,
              color: Colors.white,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              notifier.getCurrentWeather.chanceRain.toString() + " %",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenHeight(16)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              "Rain",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black54,
                  fontSize: getProportionateScreenHeight(16)),
            )
          ],
        )
      ],
    );
  }
}
