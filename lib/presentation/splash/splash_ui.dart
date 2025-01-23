import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zartek/injector.dart';
import 'package:zartek/presentation/splash/bloc/splash_bloc.dart';
import 'package:zartek/presentation/splash/ui/splash_screen.dart';

class SplashUi extends StatelessWidget {
  const SplashUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) =>
          SplashBloc(authentication: injector())..add(SplashInitialEvent()),
      child: const SplashScreen(),
    );
  }
}
