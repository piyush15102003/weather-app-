import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';

import '../data/data.dart';

part 'weather_app_event.dart';
part 'weather_app_state.dart';

class WeatherAppBloc extends Bloc<WeatherAppEvent, WeatherAppState> {
  WeatherAppBloc() : super(WeatherAppInitial()) {
    on<fetchWeather>((event, emit) async {
      emit(WeatherAppLoading());
      try{
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude
        );
        emit(WeatherAppSuccess(weather));
      } catch(e){
        emit(WeatherAppFailure());
      }
    });
  }
}
