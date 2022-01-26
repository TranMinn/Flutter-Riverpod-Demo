import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class RiverpodWithStateProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    int count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod with StateProvider')),
      body: Center(
        // Consumer is a widget that allows you reading providers.
        // You could also use the hook "ref.watch(" if you uses flutter_hooks
        // child: Consumer(builder: (context, ref, _) {
        //   final count = ref.watch(counterProvider.state).state;
        //   return Text('$count');
        // }),
        child: Text('$count'),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () {
          ref.read(counterProvider.state).state++;
          // print(ref.read(counterProvider));
        } ,
        child: const Icon(Icons.add),
      ),
    );
  }
}