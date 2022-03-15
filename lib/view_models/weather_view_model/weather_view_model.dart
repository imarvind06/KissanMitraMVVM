import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kissanmitra/models/weather_current_data_model/current_data_model.dart';
import 'package:kissanmitra/models/weather_sevenday_data_model/sevenday_data_model.dart';
import 'package:kissanmitra/models/weather_today_data_model/today_data_model.dart';
import 'package:kissanmitra/services/location_service/location_service.dart';
import 'package:kissanmitra/services/weather_service/weather_services.dart';
import 'package:kissanmitra/utils/constants.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherService _weatherService;
  WeatherViewModel(this._weatherService);
  late WeatherCurrentDataModel _currentWeather;
  List<WeatherTodayDataModel> _todayWeathers = [];
  List<WeatherSevenDayDataModel> _sevenDayWeathers = [];
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  WeatherCurrentDataModel get getCurrentWeather => _currentWeather;
  List<WeatherTodayDataModel> get getTodayWeathers => _todayWeathers;
  List<WeatherSevenDayDataModel> get getSevenDayWeathers => _sevenDayWeathers;

  Future<void> getData() async {
    _isLoading = true;
    bool _isLocationEnable = await isLocationEnable();
    debugPrint("lat and long : ${lat}");
    if (_isLocationEnable) {
      debugPrint("lat : $lat");
      bool _isGetDataFromApi = await isGetDataFromApi();
      debugPrint("check : $_isGetDataFromApi");
      if (_isGetDataFromApi) {
        _currentWeather = _weatherService.currentWeather();
        _todayWeathers = _weatherService.todayWeather();
        _sevenDayWeathers = _weatherService.sevenDayWeather();

        debugPrint("current : $_todayWeathers");
      }
      _isLoading = false;
      notifyListeners();
    } else {
      debugPrint("some error");
    }
  }

  Future<bool> isGetDataFromApi() async {
    bool checkData = await _weatherService.getDataFromServer();
    return checkData;
  }

  Future<bool> isLocationEnable() async {
    Position p = await LocationService().determinePosition();
    debugPrint("lat and long : ${lat}");
    if (lat != 0.0 && lat != 1.0) {
      lat = p.latitude;
      lon = p.longitude;
      return true;
    } else {
      return false;
    }
  }
}
