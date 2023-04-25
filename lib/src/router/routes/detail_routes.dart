import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:vinhcine/src/features/detail/presentation/views/detail_screen.dart';

final detailRoutes = [
  GoRoute(
    path: 'details',
    builder: (BuildContext context, GoRouterState state) {
      return const DetailsScreen();
    },
  ),
];
