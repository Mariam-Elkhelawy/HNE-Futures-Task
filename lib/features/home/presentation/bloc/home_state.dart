part of 'home_bloc.dart';

@immutable
class HomeState {
  final int navIndex;

  const HomeState(this.navIndex);

  HomeState copyWith({int? navIndex}) {
    return HomeState(navIndex ?? this.navIndex);
  }
}
