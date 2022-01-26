import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = StateProvider((ref) => "Hello");

class RiverpodWithStatefulWidget extends ConsumerStatefulWidget {
  const RiverpodWithStatefulWidget({Key? key}) : super(key: key);

  @override
  _RiverpodWithStatefulWidgetState createState() => _RiverpodWithStatefulWidgetState();
}

class _RiverpodWithStatefulWidgetState extends ConsumerState<RiverpodWithStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    String helloText = ref.watch(hello);
    return Container(child: Text(helloText),);
  }
}
