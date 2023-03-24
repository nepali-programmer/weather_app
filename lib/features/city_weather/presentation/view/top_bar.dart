import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constant/app_constant.dart';
import '../cubit/city_weather/city_weather_cubit.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  late TextEditingController _cityController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cityController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  getWeather() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      context.read<CityWeatherCubit>().getWeatherData(
            _cityController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultSpacing),
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                  hintText: 'Enter city name',
                  errorMaxLines: 3,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter city name';
                  } else if (value.length < 4) {
                    return 'Minimum 4 character required for city name';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onEditingComplete: () {
                  getWeather();
                },
              ),
            ),
            const SizedBox(width: kSmallSpacing),
            ElevatedButton(
              child: const Icon(Icons.search),
              onPressed: () {
                getWeather();
              },
            ),
          ],
        ),
      ),
    );
  }
}
