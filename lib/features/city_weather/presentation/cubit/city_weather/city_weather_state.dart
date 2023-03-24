part of 'city_weather_cubit.dart';

abstract class CityWeatherState extends Equatable {
  const CityWeatherState();

  @override
  List<Object> get props => [];
}

class CityWeatherInitial extends CityWeatherState {}
