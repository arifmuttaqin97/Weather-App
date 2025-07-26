import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/model/current_weather.dart';
import 'package:weather_app/repository/current_repository.dart';

part 'current_event.dart';
part 'current_state.dart';

class CurrentBloc extends Bloc<CurrentEvent, CurrentState> {
  CurrentBloc() : super(CurrentInitial()) {
    on<GetCurrentWeather>((event, emit) async {
      emit(CurrentLoading());
      final result = await CurrentRepository.getCurrentWeather(
        lat: event.lat,
        long: event.long,
      );
      if (emit.isDone) return;
      result.fold(
        (failure) {
          emit(CurrentFail(message: failure));
        },
        (success) {
          emit(CurrentSuccess(model: success));
        },
      );
    });
  }
}
