import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gold_event.dart';
part 'gold_state.dart';

class GoldBloc extends Bloc<GoldEvent, GoldState> {
  GoldBloc() : super(GoldInitial()) {
    on<GoldEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
