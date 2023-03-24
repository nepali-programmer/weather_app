import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'city_weather_state.dart';

class CityWeatherCubit extends Cubit<CityWeatherState> {
  CityWeatherCubit() : super(CityWeatherInitial());
}
