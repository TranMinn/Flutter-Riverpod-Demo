import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/riverpod_with_changeNotifier.dart';
import 'package:riverpod_demo/riverpod_with_provider.dart';
import 'package:riverpod_demo/riverpod_with_stateNotifierProvider.dart';
import 'package:riverpod_demo/riverpod_with_stateProvider.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectButton(label: 'Riverpod with Provider', screen: RiverpodWithProvider()),
            SelectButton(label: 'Riverpod with State Provider', screen: RiverpodWithStateProvider()),
            SelectButton(label: 'Riverpod with State Notifier Provider', screen: RiverpodWithStateNotifierProvider()),
            SelectButton(label: 'Riverpod with Change Notifier', screen: RiverpodWithChangeNotifier()),
          ],
        ),
      ),
    );
  }
}

class SelectButton extends StatelessWidget {
  final String label;
  final Widget screen;
  const SelectButton({
    Key? key, required this.label, required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => screen)),
        child: Text(label));
  }
}
