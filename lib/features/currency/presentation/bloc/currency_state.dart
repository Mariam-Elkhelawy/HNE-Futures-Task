part of 'currency_bloc.dart';

@immutable
 class CurrencyState {
  final ScreenStatus? status;
  final CurrencyModel? currencyModel;
  final Failures? failures;

  const CurrencyState({this.status, this.currencyModel, this.failures});
  CurrencyState copyWith(
      {ScreenStatus? status, CurrencyModel? currencyModel, Failures? failures}) {
    return CurrencyState(
      status: status ?? this.status,
      currencyModel: currencyModel ?? this.currencyModel,
      failures: failures ?? this.failures,
    );
  }
}

final class CurrencyInitialState extends CurrencyState {

  const CurrencyInitialState(): super(status: ScreenStatus.initial);
}
