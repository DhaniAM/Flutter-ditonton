import 'package:ditonton/common/state_enum.dart';
import 'package:flutter/foundation.dart';

class BottomNavigationBarNotifier extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  RequestState _requestState = RequestState.Empty;
  RequestState get requestState => _requestState;

  void changeIndex(int value) {
    _requestState = RequestState.Loading;
    notifyListeners();

    _index = value;
    _requestState = RequestState.Loaded;
    notifyListeners();
  }
}
