import 'package:flutter_test/flutter_test.dart';
import 'package:kissanmitra/services/weather_service/weather_services.dart';
import 'package:kissanmitra/view_models/weather_view_model/weather_view_model.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherService extends Mock implements WeatherService {}

void main() {
  late WeatherViewModel weatherViewModel;
  late MockWeatherService mockWeatherService;
  setUp(() {
    mockWeatherService = MockWeatherService();
    weatherViewModel = WeatherViewModel(mockWeatherService);
  });
  group("Checking for  values of fn", () {
    test("check for _sevenDayWeathers values", () {
      expect(weatherViewModel.getSevenDayWeathers, []);
    });
    test("check for _todayWeathers values", () {
      expect(weatherViewModel.getTodayWeathers, []);
    });
    test("check for _isLoading values", () {
      expect(weatherViewModel.isLoading, true);
    });
  });
}
