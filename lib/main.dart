import 'package:flutter/material.dart';
import 'package:hne_futures_task/features/home_screen.dart';

void main() {
  runApp(const HNEFuturesTask());
}

class HNEFuturesTask extends StatelessWidget {
  const HNEFuturesTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
