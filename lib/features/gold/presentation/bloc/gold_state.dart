part of 'gold_bloc.dart';

@immutable
class GoldState {
 final ScreenStatus? status;
 final GoldModel? goldModel;
 final Failures? failures;

  const GoldState({this.status, this.goldModel, this.failures});
  GoldState copyWith(
      {ScreenStatus? status, GoldModel? goldModel, Failures? failures}) {
    return GoldState(
      status: status ?? this.status,
      goldModel: goldModel ?? this.goldModel,
      failures: failures ?? this.failures,
    );
  }
}

final class GoldInitialState extends GoldState {
  const GoldInitialState() : super(status: ScreenStatus.initial);
}
