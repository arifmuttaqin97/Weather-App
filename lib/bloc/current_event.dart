part of 'current_bloc.dart';

sealed class CurrentEvent extends Equatable {
  const CurrentEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrentWeather extends CurrentEvent {
  final double lat;
  final double long;

  const GetCurrentWeather({required this.lat, required this.long});

  @override
  List<Object?> get props => [lat, long];
}
