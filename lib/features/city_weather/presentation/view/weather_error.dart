import 'package:flutter/material.dart';

import '../../../../data/constant/app_constant.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.errorContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: kExtraLargeSpacing),
          Icon(
            Icons.warning,
            size: kLargeIcon,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          Text(
            'Opps',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'There was a problem loading weather.\nTry again later',
            style: TextStyle(
              fontSize: 14.0,
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
