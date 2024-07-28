part of 'weather_app_bloc.dart';

@immutable
sealed class WeatherAppEvent extends Equatable{
  const WeatherAppEvent();

  @override
  List<Object> get props => [];
}

class fetchWeather extends WeatherAppEvent {
 final Position position;

 const fetchWeather(this.position);

 @override
 List<Object> get props => [position];
}
