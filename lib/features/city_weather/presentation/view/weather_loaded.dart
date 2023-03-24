import 'package:flutter/material.dart';

import '../../../../data/constant/app_constant.dart';
import '../../data/model/weather_model.dart';
import 'weather_empty.dart';

class WeatherLoaded extends StatelessWidget {
  final WeatherList weather;
  const WeatherLoaded({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    List<WeatherModel> list = weather.list;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: kDefaultSpacing,
            right: kDefaultSpacing,
            bottom: kDefaultSpacing,
          ),
          child: Text('City: ${weather.city.name}'),
        ),
        const Divider(),
        Expanded(
          child: list.isEmpty
              ? const WeatherEmpty()
              : ListView.builder(
                  padding: const EdgeInsets.all(kDefaultSpacing),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return WeatherCard(
                      weather: list[index],
                    );
                  },
                ),
        ),
      ],
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
      margin: const EdgeInsets.only(bottom: kDefaultSpacing),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(weather.date.toString()),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Image.network(
              weather.weather[0].icon,
              width: 56.0,
            ),
            title: Text(weather.weather[0].main),
            subtitle: Text(weather.weather[0].description),
            dense: true,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('Temp'),
                  subtitle: Text(weather.temp),
                  dense: true,
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Visibility'),
                  subtitle: Text(weather.visibility),
                  dense: true,
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Humidity'),
                  subtitle: Text(weather.humidity),
                  dense: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
