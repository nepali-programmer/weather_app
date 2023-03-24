import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/weather_api_credential.dart';
import '../model/city_model.dart';
import '../model/weather_model.dart';

abstract class CityWeatherOnlineDataSource {
  Future<WeatherList> getWeather(String cityName);
}

@LazySingleton(as: CityWeatherOnlineDataSource)
class CityWeatherOnlineDataSourceImpl implements CityWeatherOnlineDataSource {
  final WeatherApiCredential weatherApiCredential;

  CityWeatherOnlineDataSourceImpl({
    required this.weatherApiCredential,
  });

  @override
  Future<WeatherList> getWeather(String cityName) async {
    // getting lat lon
    Dio dio = Dio();
    Response cityResponse = await dio.get(
      'https://api.openweathermap.org/geo/1.0/direct',
      queryParameters: {
        'q': cityName,
        'limit': 1,
        'appid': weatherApiCredential.apiKey,
      },
    );
    WeatherList weather = WeatherList(
      list: [],
      city: WeatherCity(name: cityName),
    );
    if (cityResponse.data.length > 0) {
      CityModel cityModel = CityModel.fromMap(cityResponse.data[0]);
      // getting weather
      Response weatherResponse = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast',
        queryParameters: {
          'lat': cityModel.lat,
          'lon': cityModel.lon,
          'appid': weatherApiCredential.apiKey,
        },
      );
      weather = WeatherList.fromMap(weatherResponse.data);
    }
    return weather;
  }
}
