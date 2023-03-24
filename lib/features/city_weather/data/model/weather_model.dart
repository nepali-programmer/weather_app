// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherDetailModel {
  final String main;
  final String description;
  final String icon;
  WeatherDetailModel({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDetailModel.fromMap(Map<String, dynamic> map) {
    return WeatherDetailModel(
      main: map['main'] ?? '',
      description: map['description'] ?? '',
      icon: 'https://openweathermap.org/img/wn/${map['icon'] ?? ''}@2x.png',
    );
  }
}

class WeatherModel {
  final DateTime date;
  final DateTime sunrise;
  final DateTime sunset;
  final List<WeatherDetailModel> weather;
  WeatherModel({
    required this.date,
    required this.sunrise,
    required this.sunset,
    required this.weather,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      date: DateTime.fromMillisecondsSinceEpoch(map['dt']),
      sunrise: DateTime.fromMillisecondsSinceEpoch(map['sunrise']),
      sunset: DateTime.fromMillisecondsSinceEpoch(map['sunset']),
      weather: List<WeatherDetailModel>.from(
        (map['weather'] ?? []).map<WeatherDetailModel>(
          (x) => WeatherDetailModel.fromMap(x ?? {}),
        ),
      ),
    );
  }
}
