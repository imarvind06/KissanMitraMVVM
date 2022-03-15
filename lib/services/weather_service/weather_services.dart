import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:kissanmitra/apis/weather_data_apis/weather_api.dart';
import 'package:kissanmitra/helper/find_icon.dart';
import 'package:kissanmitra/models/weather_current_data_model/current_data_model.dart';
import 'package:kissanmitra/models/weather_sevenday_data_model/sevenday_data_model.dart';
import 'package:kissanmitra/models/weather_today_data_model/today_data_model.dart';

class WeatherService {
  DateTime date = DateTime.now();
  late var res;

  Future<bool> getDataFromServer() async {
    var response = await getResponseFromApis();
    if (response.statusCode == 200) {
      res = json.decode(response.body);
      return true;
    }
    return false;
  }

  WeatherCurrentDataModel currentWeather() {
    var current = res["current"];

    WeatherCurrentDataModel currentTemp = WeatherCurrentDataModel(
      current: current["temp"]?.round() ?? 0,
      name: current["weather"][0]["main"].toString(),
      day: DateFormat("EEEE dd MMMM").format(date),
      wind: current["wind_speed"]?.round() ?? 0,
      humidity: current["humidity"]?.round() ?? 0,
      chanceRain: current["uvi"]?.round() ?? 0,
      image: findIcon(current["weather"][0]["main"].toString(), true),
    );

    return currentTemp;
  }

  List<WeatherTodayDataModel> todayWeather() {
    List<WeatherTodayDataModel> todayWeather = [];
    int hour = int.parse(DateFormat("hh").format(date));
    for (var i = 0; i < 4; i++) {
      var temp = res["hourly"];
      var hourly = WeatherTodayDataModel(
          current: temp[i]["temp"]?.round() ?? 0,
          image: findIcon(temp[i]["weather"][0]["main"].toString(), false),
          time: Duration(hours: hour + i + 1).toString().split(":")[0] + ":00");
      todayWeather.add(hourly);
    }
    return todayWeather;
  }

  List<WeatherSevenDayDataModel> sevenDayWeather() {
    List<WeatherSevenDayDataModel> sevenDay = [];
    for (var i = 0; i < 7; i++) {
      String day = DateFormat("EEEE")
          .format(DateTime(date.year, date.month, date.day + i + 1))
          .substring(0, 3);
      var temp = res["daily"][i];
      var hourly = WeatherSevenDayDataModel(
        max: temp["temp"]["max"]?.round() ?? 0,
        min: temp["temp"]["min"]?.round() ?? 0,
        image: findIcon(temp["weather"][0]["main"].toString(), false),
        name: temp["weather"][0]["main"].toString(),
        day: day,
      );
      sevenDay.add(hourly);
    }
    return sevenDay;
  }
}
