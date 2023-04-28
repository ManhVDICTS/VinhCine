import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(String.fromEnvironment('BASE_URL'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('Go to the Details screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/signIn'),
              child: const Text('Go to the Sign in screen'),
            ),
          ],
        ),
      ),
    );
  }
}
