import 'package:dartz/dartz.dart';

import '../../../../core/error/app_error.dart';
import '../../data/model/weather_model.dart';

abstract class CityWeatherRepository {
  Future<Either<AppError, WeatherList>> getWeather(String cityName);
}
