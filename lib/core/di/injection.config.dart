// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_app/core/api/weather_api_credential.dart' as _i4;
import 'package:weather_app/core/theme/app_theme.dart' as _i3;
import 'package:weather_app/features/city_weather/data/repository/city_weather_repository.dart'
    as _i7;
import 'package:weather_app/features/city_weather/data/source/city_weather_online_data_source.dart'
    as _i5;
import 'package:weather_app/features/city_weather/domain/repository/city_weather_repository.dart'
    as _i6;
import 'package:weather_app/features/city_weather/domain/usecase/get_weather.dart'
    as _i8;
import 'package:weather_app/features/city_weather/presentation/cubit/city_weather/city_weather_cubit.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppThemeData>(() => _i3.AppThemeData());
    gh.lazySingleton<_i4.WeatherApiCredential>(
        () => _i4.WeatherApiCredential());
    gh.lazySingleton<_i5.CityWeatherOnlineDataSource>(() =>
        _i5.CityWeatherOnlineDataSourceImpl(
            weatherApiCredential: gh<_i4.WeatherApiCredential>()));
    gh.lazySingleton<_i6.CityWeatherRepository>(() =>
        _i7.CityWeatherReposotiryImpl(
            cityWeatherOnlineDataSource:
                gh<_i5.CityWeatherOnlineDataSource>()));
    gh.lazySingleton<_i8.GetWeather>(() =>
        _i8.GetWeather(cityWeatherRepository: gh<_i6.CityWeatherRepository>()));
    gh.factory<_i9.CityWeatherCubit>(
        () => _i9.CityWeatherCubit(getWeather: gh<_i8.GetWeather>()));
    return this;
  }
}
