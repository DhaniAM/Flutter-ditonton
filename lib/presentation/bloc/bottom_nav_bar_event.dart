import 'package:equatable/equatable.dart';

abstract class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();
}

class OnClick extends BottomNavBarEvent {
  final int clickedIndex;
  OnClick(this.clickedIndex);

  @override
  List<Object> get props => [clickedIndex];
}
