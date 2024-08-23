import 'package:bloc/bloc.dart';
import 'package:hne_futures_task/core/enums/enums.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:hne_futures_task/features/currency/data/models/CurrencyModel.dart';
import 'package:hne_futures_task/features/currency/domain/use_cases/currency_usecase.dart';
import 'package:meta/meta.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyUseCase currencyUseCase;
  CurrencyBloc(this.currencyUseCase) : super(const CurrencyInitialState()) {
    on<CurrencyEvent>((event, emit) async {
      emit(state.copyWith(status: ScreenStatus.loading));
      var result = await currencyUseCase.getCurrency();
      result.fold((l) {
        emit(state.copyWith(status: ScreenStatus.failure, failures: l));
      }, (r) {
        emit(state.copyWith(status: ScreenStatus.success, currencyModel: r));
      });
    });
  }
}
