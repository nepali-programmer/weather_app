// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/app_error.dart';
import 'package:weather_app/features/city_weather/data/model/weather_model.dart';
import 'package:weather_app/features/city_weather/domain/usecase/get_weather.dart';

part 'city_weather_cubit.freezed.dart';
part 'city_weather_state.dart';

@injectable
class CityWeatherCubit extends Cubit<CityWeatherState> {
  GetWeather getWeather;
  CityWeatherCubit({
    required this.getWeather,
  }) : super(CityWeatherState.initial());

  getWeatherData(String city) async {
    emit(CityWeatherState.loading());
    await Future.delayed(const Duration(seconds: 2));
    Either<AppError, List<WeatherModel>> result = await getWeather(city);
    result.fold(
      (l) => emit(CityWeatherState.error()),
      (r) => emit(CityWeatherState.loaded(weather: r)),
    );
  }
}
