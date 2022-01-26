import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myNumber = StateNotifierProvider<MyNumber, int>((ref) => MyNumber());

class RiverpodWithStateNotifierProvider extends ConsumerWidget {
  const RiverpodWithStateNotifierProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    int number = ref.watch(myNumber) as int;

    // ref.listen -> a callback function -> execute whenever provider changed
    // next -> the next state
    ref.listen<int>(myNumber, (int? previousState, int nextState) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$nextState')));
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod with StateProvider')),
      body: Center(
        child: Text('$number'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(myNumber.notifier).increaseNumber();
        } ,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyNumber extends StateNotifier<int>{
  MyNumber() : super(100);

  void increaseNumber() {
    state++;
  }
}


