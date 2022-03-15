class WeatherCurrentDataModel {
  final int current;
  final String name;
  final String day;
  final int wind;
  final int humidity;
  final int chanceRain;
  final String image;

  WeatherCurrentDataModel({
    required this.current,
    required this.name,
    required this.day,
    required this.wind,
    required this.humidity,
    required this.chanceRain,
    required this.image,
  });
}
