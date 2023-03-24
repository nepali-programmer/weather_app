import 'package:flutter/material.dart';

import '../../../../data/constant/app_constant.dart';
import '../../data/model/weather_model.dart';
import 'weather_empty.dart';

class WeatherList extends StatelessWidget {
  final List<WeatherModel> weather;
  const WeatherList({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    if (weather.isEmpty) {
      return const WeatherEmpty();
    }
    return ListView.builder(
      padding: const EdgeInsets.all(kDefaultSpacing),
      itemCount: weather.length,
      itemBuilder: (context, index) {
        return WeatherCard(
          weather: weather[index],
        );
      },
    );
  }
}

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultSpacing),
      child: Column(
        children: [
          Image.network(weather.weather[0].icon),
        ],
      ),
    );
  }
}
