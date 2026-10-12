import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class ColorProvider extends ChangeNotifier {
  bool _isSwitched = false;
  Color _currentColor = Colors.green;

  bool get isSwitched => _isSwitched;
  Color get currentColor => _currentColor;

  void toggleSwitch(bool value) {
    _isSwitched = value;
    _currentColor = Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1,
    );
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorProvider(),
      child: const MaterialApp(home: HomeScreen()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework Provider'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 180,
              height: 180,
              color: colorProvider.currentColor,
            ),
            const SizedBox(height: 30),
            Switch(
              value: colorProvider.isSwitched,
              onChanged: (value) {
                colorProvider.toggleSwitch(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
