import 'package:ditonton/presentation/bloc/bottom_nav_bar_event.dart';
import 'package:ditonton/presentation/bloc/bottom_nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  /// This super is initial invocation, equal to initState
  /// No need to create onLoad or init method
  BottomNavBarBloc() : super(BottomNavBarData(0)) {
    on<OnClick>((event, emit) {
      emit(BottomNavBarLoading());
      final currentIndex = event.clickedIndex;
      emit(BottomNavBarData(currentIndex));
    });
  }
}
