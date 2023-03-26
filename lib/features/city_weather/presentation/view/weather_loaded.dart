import 'package:flutter/material.dart';
import 'package:weather_app/core/extension/date_extension.dart';

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
          Text(DateTime.parse(weather.date).beautiful()),
          Row(
            children: [
              Text(
                '${weather.temp}°',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Image.network(
                weather.weather[0].icon,
                width: 72.0,
                height: 72.0,
              ),
              Expanded(
                child: ListTile(
                  horizontalTitleGap: 0.0,
                  iconColor: Theme.of(context).colorScheme.primary,
                  trailing: const Icon(Icons.air),
                  dense: true,
                  title: Text(
                    '${weather.windSpeed} km/h',
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(weather.weather[0].main),
            subtitle: Text(weather.weather[0].description),
            dense: true,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  horizontalTitleGap: 0.0,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(Icons.landscape),
                  title: const Text('Visibility'),
                  subtitle: Text(weather.visibility),
                  dense: true,
                ),
              ),
              Expanded(
                child: ListTile(
                  horizontalTitleGap: 0.0,
                  iconColor: Theme.of(context).colorScheme.primary,
                  leading: const Icon(Icons.water_drop),
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
