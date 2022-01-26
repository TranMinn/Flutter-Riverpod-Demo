import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) {
  return Future.value(36);
});

class RiverpodWithFutureBuilder extends ConsumerWidget {
  const RiverpodWithFutureBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(futureProvider);
    return Scaffold(
      body: Center(
        child: asyncValue.when(
            data: (data) => Text('Async value: $data'),
            error: (e, st) => Text('Error: $e'),
            loading: () => CircularProgressIndicator()),
      ),
    );
  }
}
