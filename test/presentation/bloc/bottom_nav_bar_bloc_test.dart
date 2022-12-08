import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/bottom_nav_bar_bloc.dart';
import 'package:ditonton/presentation/bloc/bottom_nav_bar_event.dart';
import 'package:ditonton/presentation/bloc/bottom_nav_bar_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BottomNavBarBloc bottomNavBarBloc;

  setUp(() {
    bottomNavBarBloc = BottomNavBarBloc();
  });

  test('initial state should be index 0 and has data', () {
    expect(bottomNavBarBloc.state, BottomNavBarData(0));
  });

  blocTest<BottomNavBarBloc, BottomNavBarState>(
    'Should emit [Loading, HasData] when nav is clicked',
    build: () {
      return bottomNavBarBloc;
    },
    act: (bloc) => bloc.add(OnClick(1)),
    expect: () => [
      BottomNavBarLoading(),
      BottomNavBarData(1),
    ],
  );
}
