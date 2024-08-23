import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(0)) {
    on<HomeIndexChanged>((event, emit) {
      emit(state.copyWith(navIndex: event.index));
    });
  }
}
