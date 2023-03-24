import 'package:flutter/cupertino.dart';

import '../../../../data/constant/app_constant.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(height: kExtraLargeSpacing),
        CupertinoActivityIndicator(radius: kDefaultSpacing),
        SizedBox(height: kDefaultSpacing),
        Text(
          'Loading...',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
