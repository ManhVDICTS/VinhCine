import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/router/route_names.dart';
import 'package:vinhcine/src/router/router.dart';

@RoutePage(name: homeScreenName)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => {context.pushRoute(const DetailScreenRoute())},
              child: const Text('Go to the Details screen'),
            ),
            ElevatedButton(
              onPressed: () => {context.pushRoute(SignInScreenRoute())},
              child: const Text('Go to the Sign in screen'),
            ),
            ElevatedButton(
              onPressed: () => {context.pushRoute(ProfileScreenRoute())},
              child: const Text('Go to the Profile screen'),
            ),
          ],
        ),
      ),
    );
  }
}
