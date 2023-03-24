import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../cubit/city_weather/city_weather_cubit.dart';
import 'top_bar.dart';
import 'weather_error.dart';
import 'weather_initial.dart';
import 'weather_list.dart';
import 'weather_loading.dart';

class CityWeather extends StatelessWidget {
  const CityWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CityWeatherCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const TopBar(),
            Expanded(
              child: BlocBuilder<CityWeatherCubit, CityWeatherState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const WeatherInitial(),
                    loading: () => const WeatherLoading(),
                    error: () => const WeatherError(),
                    loaded: (weather) => WeatherList(weather: weather),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
