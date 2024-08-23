import 'package:bloc/bloc.dart';
import 'package:hne_futures_task/core/enums/enums.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:hne_futures_task/features/gold/data/models/GoldModel.dart';
import 'package:hne_futures_task/features/gold/domain/use_cases/gold_usecase.dart';
import 'package:meta/meta.dart';

part 'gold_event.dart';
part 'gold_state.dart';

class GoldBloc extends Bloc<GoldEvent, GoldState> {
  GoldUseCase goldUseCase;
  GoldBloc(this.goldUseCase) : super(const GoldInitialState()) {
    on<GoldEvent>((event, emit) async {
      emit(state.copyWith(status: ScreenStatus.loading));
      var result = await goldUseCase.getGoldPrices();
      result.fold((l) {
        emit(state.copyWith(status: ScreenStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(status: ScreenStatus.success, goldModel: r));
      });
    });
  }
}
