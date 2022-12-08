import 'package:equatable/equatable.dart';

abstract class BottomNavBarState extends Equatable {
  const BottomNavBarState();

  @override
  List<Object> get props => [];
}

class BottomNavBarLoading extends BottomNavBarState {}

class BottomNavBarError extends BottomNavBarState {}

class BottomNavBarData extends BottomNavBarState {
  final int navBarIndex;
  BottomNavBarData(this.navBarIndex);

  @override
  List<Object> get props => [navBarIndex];
}
