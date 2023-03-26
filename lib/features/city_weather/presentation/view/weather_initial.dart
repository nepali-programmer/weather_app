import 'package:flutter/material.dart';

import '../../../../data/constant/app_constant.dart';

class WeatherInitial extends StatelessWidget {
  const WeatherInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: kExtraLargeSpacing),
        Image.asset(
          'assets/images/weather.png',
          width: 100.0,
          height: 100.0,
        ),
        const SizedBox(height: kDefaultSpacing),
        const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Enter city name to view weather',
          style: TextStyle(
            fontSize: 14.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
