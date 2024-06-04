import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/view_model/counter_view_model.dart';

//Creating a provider

final appBarTitleProvider = Provider<String>((ref) => 'This is My Title');
final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(counterViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.read(appBarTitleProvider)),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          value.toString(),
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterViewModelProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterViewModelProvider.notifier).decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
