import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zartek/core/routes/route_name.dart';
import 'package:zartek/presentation/splash/bloc/splash_bloc.dart';
import 'package:zartek/presentation/widgets/app_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is AuthenticatedAccount) {
            context.go(RouteName.home);
          } else if (state is UnAuthenticatedAccount) {
            context.go(RouteName.auth);
          }
        },
        child: Column(),
      ),
    );
  }
}
