import 'package:go_router/go_router.dart';
import 'package:zartek/core/routes/page_transition.dart';
import 'package:zartek/core/routes/route_name.dart';
import 'package:zartek/presentation/auth/auth_ui.dart';
import 'package:zartek/presentation/home/home_ui.dart';
import 'package:zartek/presentation/splash/splash_ui.dart';

class AppRoutes {
  AppRoutes._();
  static final GoRouter appRoutes = GoRouter(routes: [
    PageTransition.pageTransition(
      path: RouteName.splash,
      pageBuilder: (context, index) => const SplashUi(),
    ),
    PageTransition.pageTransition(
        path: RouteName.auth, pageBuilder: (context, index) => const AuthUi()),
    PageTransition.pageTransition(
        path: RouteName.home, pageBuilder: (context, index) => const HomeUi())
  ]);
}
