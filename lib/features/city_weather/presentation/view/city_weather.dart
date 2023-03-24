import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class CityWeather extends StatelessWidget {
  const CityWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
    );
  }
}
