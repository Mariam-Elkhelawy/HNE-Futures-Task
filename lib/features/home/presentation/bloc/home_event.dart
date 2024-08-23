part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeIndexChanged extends HomeEvent {
  final int index;
  HomeIndexChanged(this.index);
}
