import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// User multiple provider with same type
// No need to specify data type
final first = StateProvider((ref) => "Hello");
final second = StateProvider((ref) => 5);

class RiverpodWithProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String firstProvider = ref.watch(first);
    int secondProvider = ref.watch(second);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod with Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstProvider),
            Text(secondProvider.toString()),
          ],
        ),
      ),
    );
  }
}
