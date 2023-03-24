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
  final String date;
  final String visibility;
  final String humidity;
  final String temp;
  final List<WeatherDetailModel> weather;
  WeatherModel({
    required this.date,
    required this.weather,
    required this.visibility,
    required this.humidity,
    required this.temp,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      date: map['dt_txt'] ?? '',
      visibility: map['visibility'].toString(),
      humidity: map['main']['humidity'].toString(),
      temp: (map['main']['temp'] - 273).toStringAsFixed(2),
      weather: List<WeatherDetailModel>.from(
        (map['weather'] ?? []).map<WeatherDetailModel>(
          (x) => WeatherDetailModel.fromMap(x ?? {}),
        ),
      ),
    );
  }
}

class WeatherCity {
  final String name;
  WeatherCity({
    required this.name,
  });

  factory WeatherCity.fromMap(Map<String, dynamic> map) {
    return WeatherCity(
      name: map['name'] as String,
    );
  }
}

class WeatherList {
  final List<WeatherModel> list;
  final WeatherCity city;

  WeatherList({
    required this.list,
    required this.city,
  });
  factory WeatherList.fromMap(Map<String, dynamic> map) {
    return WeatherList(
      list: List<WeatherModel>.from(
        (map['list'] ?? []).map<WeatherModel>(
          (x) => WeatherModel.fromMap(x ?? {}),
        ),
      ),
      city: WeatherCity.fromMap(map['city'] ?? {}),
    );
  }
}
