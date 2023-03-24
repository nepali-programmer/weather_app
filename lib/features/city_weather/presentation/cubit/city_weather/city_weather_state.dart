part of 'city_weather_cubit.dart';

@freezed
class CityWeatherState with _$CityWeatherState {
  factory CityWeatherState.initial() = _CityWeatherInitialState;
  factory CityWeatherState.loading() = _CityWeatherLoadingState;
  factory CityWeatherState.error() = _CityWeatherErrorState;
  factory CityWeatherState.loaded({
    required List<WeatherModel> weather,
  }) = _CityWeatherLoadedState;
}
