import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/weather_api_credential.dart';
import '../model/city_model.dart';
import '../model/weather_model.dart';

abstract class CityWeatherOnlineDataSource {
  Future<List<WeatherModel>> getWeather(String cityName);
}

var tempData = [
  {
    "dt": 1661857200,
    "sunrise": 1661834187,
    "sunset": 1661882248,
    "temp": {
      "day": 299.66,
      "min": 288.93,
      "max": 299.66,
      "night": 290.31,
      "eve": 297.16,
      "morn": 288.93
    },
    "feels_like": {"day": 299.66, "night": 290.3, "eve": 297.1, "morn": 288.73},
    "pressure": 1017,
    "humidity": 44,
    "weather": [
      {"id": 500, "main": "Rain", "description": "light rain", "icon": "10d"}
    ],
    "speed": 2.7,
    "deg": 209,
    "gust": 3.58,
    "clouds": 53,
    "pop": 0.7,
    "rain": 2.51
  },
  {
    "dt": 1661943600,
    "sunrise": 1661920656,
    "sunset": 1661968542,
    "temp": {
      "day": 295.76,
      "min": 287.73,
      "max": 295.76,
      "night": 289.37,
      "eve": 292.76,
      "morn": 287.73
    },
    "feels_like": {
      "day": 295.64,
      "night": 289.45,
      "eve": 292.97,
      "morn": 287.59
    },
    "pressure": 1014,
    "humidity": 60,
    "weather": [
      {"id": 500, "main": "Rain", "description": "light rain", "icon": "10d"}
    ],
    "speed": 2.29,
    "deg": 215,
    "gust": 3.27,
    "clouds": 66,
    "pop": 0.82,
    "rain": 5.32
  },
  {
    "dt": 1662030000,
    "sunrise": 1662007126,
    "sunset": 1662054835,
    "temp": {
      "day": 293.38,
      "min": 287.06,
      "max": 293.38,
      "night": 287.06,
      "eve": 289.01,
      "morn": 287.84
    },
    "feels_like": {
      "day": 293.31,
      "night": 287.01,
      "eve": 289.05,
      "morn": 287.85
    },
    "pressure": 1014,
    "humidity": 71,
    "weather": [
      {"id": 500, "main": "Rain", "description": "light rain", "icon": "10d"}
    ],
    "speed": 2.67,
    "deg": 60,
    "gust": 2.66,
    "clouds": 97,
    "pop": 0.84,
    "rain": 4.49
  },
];

@LazySingleton(as: CityWeatherOnlineDataSource)
class CityWeatherOnlineDataSourceImpl implements CityWeatherOnlineDataSource {
  final WeatherApiCredential weatherApiCredential;

  CityWeatherOnlineDataSourceImpl({
    required this.weatherApiCredential,
  });

  @override
  Future<List<WeatherModel>> getWeather(String cityName) async {
    // getting lat lon
    Dio dio = Dio();
    Response cityResponse = await dio.get(
      'http://api.openweathermap.org/geo/1.0/direct',
      queryParameters: {
        'q': cityName,
        'limit': 1,
        'appid': weatherApiCredential.apiKey,
      },
    );
    List<WeatherModel> weather = [];
    if (cityResponse.data.length > 0) {
      CityModel cityModel = CityModel.fromMap(cityResponse.data[0]);
      // getting weather
      Response weatherResponse = await dio.get(
        'api.openweathermap.org/data/2.5/forecast/daily?lat=${cityModel.lat}&lon=${cityModel.lon}&cnt=5&appid=${weatherApiCredential.apiKey}',
      );
      weather = weatherResponse.data.map<WeatherModel>((e) {
        return WeatherModel.fromMap(e);
      }).toList();
    }
    return weather;
  }
}
