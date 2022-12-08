abstract class BottomNavBarEvent {
  const BottomNavBarEvent();
}

class OnClick extends BottomNavBarEvent {
  final int clickedIndex;
  OnClick(this.clickedIndex);
}
