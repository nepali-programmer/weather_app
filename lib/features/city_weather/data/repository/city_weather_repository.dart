import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_error.dart';
import '../../domain/repository/city_weather_repository.dart';
import '../model/weather_model.dart';
import '../source/city_weather_online_data_source.dart';

@LazySingleton(as: CityWeatherRepository)
class CityWeatherReposotiryImpl implements CityWeatherRepository {
  final CityWeatherOnlineDataSource cityWeatherOnlineDataSource;

  CityWeatherReposotiryImpl({
    required this.cityWeatherOnlineDataSource,
  });
  @override
  Future<Either<AppError, WeatherList>> getWeather(
    String cityName,
  ) async {
    try {
      WeatherList weatherList =
          await cityWeatherOnlineDataSource.getWeather(cityName);
      return right(weatherList);
    } catch (e) {
      return left(AppError());
    }
  }
}
