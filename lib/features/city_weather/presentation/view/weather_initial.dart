import 'package:flutter/material.dart';

import '../../../../data/constant/app_constant.dart';

class WeatherInitial extends StatelessWidget {
  const WeatherInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: kExtraLargeSpacing),
        Icon(
          Icons.location_city,
          size: kLargeIcon,
        ),
        Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
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
