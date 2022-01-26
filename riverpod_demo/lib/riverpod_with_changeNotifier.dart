import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterModelProvider = ChangeNotifierProvider((ref) => CounterModel());

class RiverpodWithChangeNotifier extends ConsumerWidget {
  const RiverpodWithChangeNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(counterModelProvider).value;

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod with StateProvider')),
      body: Center(
        child: Text('$count'),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () {
          ref.read(counterModelProvider).increase();
          // print(ref.read(counterProvider));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterModel extends ChangeNotifier {
  int value = 0;

  void increase() {
    value = value + 1;
    notifyListeners();
  }
}
