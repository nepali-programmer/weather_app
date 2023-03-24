import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_error.dart';
import '../../data/model/weather_model.dart';
import '../repository/city_weather_repository.dart';

@LazySingleton()
class GetWeather {
  final CityWeatherRepository cityWeatherRepository;

  GetWeather({
    required this.cityWeatherRepository,
  });
  Future<Either<AppError, List<WeatherModel>>> call(
    String cityName,
  ) async {
    return cityWeatherRepository.getWeather(cityName);
  }
}
