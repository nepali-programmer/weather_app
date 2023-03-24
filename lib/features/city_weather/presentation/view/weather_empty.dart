import 'package:flutter/material.dart';

import '../../../../data/constant/app_constant.dart';

class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: kExtraLargeSpacing),
        Icon(
          Icons.search_off,
          size: kLargeIcon,
        ),
        Text(
          'Data Not Found',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Try changing city name to get weather data',
          style: TextStyle(
            fontSize: 14.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
