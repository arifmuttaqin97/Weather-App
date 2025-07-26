part of 'current_bloc.dart';

sealed class CurrentState extends Equatable {
  const CurrentState();

  @override
  List<Object?> get props => [];
}

final class CurrentInitial extends CurrentState {}

final class CurrentLoading extends CurrentState {}

final class CurrentSuccess extends CurrentState {
  final CurrentWeather model;

  const CurrentSuccess({required this.model});

  @override
  List<Object?> get props => [model];
}

final class CurrentFail extends CurrentState {
  final String message;

  const CurrentFail({required this.message});

  @override
  List<Object?> get props => [message];
}
