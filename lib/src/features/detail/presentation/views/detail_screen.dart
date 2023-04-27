import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/src/router/route_names.dart';

@RoutePage(name: detailScreenName)
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <ElevatedButton>[
            ElevatedButton(
              onPressed: () {
                context.popRoute();
              },
              child: const Text('Go back to the Home screen'),
            ),
          ],
        ),
      ),
    );
  }
}
