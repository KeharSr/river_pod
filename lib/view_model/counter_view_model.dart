import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterViewModelProvider =
    StateNotifierProvider<CounterViewModel, int>((ref) {
  return CounterViewModel();
});

class CounterViewModel extends StateNotifier<int> {
  CounterViewModel() : super(22);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    if (state == 0) {
      return;
    }
    state = state - 1;
  }
}
