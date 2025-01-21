import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageTransition {
  static GoRoute pageTransition({
    required String path,
    required Widget Function(BuildContext, GoRouterState) pageBuilder,
  }) {
    return GoRoute(
        path: path,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              transitionDuration: const Duration(milliseconds: 300),
              child: pageBuilder(context, state),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              ),
            ));
  }
}
