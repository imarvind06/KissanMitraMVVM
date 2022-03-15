import 'package:flutter_test/flutter_test.dart';
import 'package:kissanmitra/models/weather_current_data_model/current_data_model.dart';
import 'package:kissanmitra/models/weather_sevenday_data_model/sevenday_data_model.dart';
import 'package:kissanmitra/models/weather_today_data_model/today_data_model.dart';
import 'package:kissanmitra/services/weather_service/weather_services.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherService extends Mock implements WeatherService {}

void main() {
  late MockWeatherService mockWeatherService;

  setUp(() {
    mockWeatherService = MockWeatherService();
  });

  group("Checking the getDataFromServer() Fn", () {
    test("check the value for false", () async {
      when(() => mockWeatherService.getDataFromServer()).thenAnswer((_) async {
        return false;
      });
      expect(await mockWeatherService.getDataFromServer(), false);
    });
    test("check the value for true", () async {
      when(() => mockWeatherService.getDataFromServer()).thenAnswer((_) async {
        return true;
      });
      expect(await mockWeatherService.getDataFromServer(), true);
    });
  });

  group("Checking the currentWeather() fn", () {
    WeatherCurrentDataModel weatherCurrentDataModel = WeatherCurrentDataModel(
        current: 0,
        name: "",
        day: "",
        wind: 0,
        humidity: 0,
        chanceRain: 0,
        image: "");

    test("check if function is called or not", () {
      when(() => mockWeatherService.currentWeather())
          .thenAnswer((_) => weatherCurrentDataModel);
      verifyNever(() => mockWeatherService.currentWeather());
      mockWeatherService.currentWeather();
      verify(() => mockWeatherService.currentWeather()).called(1);
    });
    test("Check for correck value", () {
      when(() => mockWeatherService.currentWeather())
          .thenAnswer((invocation) => weatherCurrentDataModel);
      expect(mockWeatherService.currentWeather(), weatherCurrentDataModel);
    });
  });

  group("Checking the todayWeather() fn", () {
    List<WeatherTodayDataModel> weatherTodayDataModel = [
      WeatherTodayDataModel(current: 0, image: "", time: '')
    ];

    test("check if function is called or not", () {
      when(() => mockWeatherService.todayWeather())
          .thenAnswer((_) => weatherTodayDataModel);
      verifyNever(() => mockWeatherService.todayWeather());
      mockWeatherService.todayWeather();
      verify(() => mockWeatherService.todayWeather()).called(1);
    });
    test("Check for correck value", () {
      when(() => mockWeatherService.todayWeather())
          .thenAnswer((invocation) => weatherTodayDataModel);
      expect(mockWeatherService.todayWeather(), weatherTodayDataModel);
    });
  });

  group("Checking the sevenDayWeather() fn", () {
    List<WeatherSevenDayDataModel> weatherSevenDayDataModel = [
      WeatherSevenDayDataModel(
        image: "",
        day: '',
        max: 0,
        min: 0,
        name: '',
      )
    ];

    test("check if function is called or not", () {
      when(() => mockWeatherService.sevenDayWeather())
          .thenAnswer((_) => weatherSevenDayDataModel);
      verifyNever(() => mockWeatherService.sevenDayWeather());
      mockWeatherService.sevenDayWeather();
      verify(() => mockWeatherService.sevenDayWeather()).called(1);
    });
    test("Check for correck value", () {
      when(() => mockWeatherService.sevenDayWeather())
          .thenAnswer((invocation) => weatherSevenDayDataModel);
      expect(mockWeatherService.sevenDayWeather(), weatherSevenDayDataModel);
    });
  });
}
