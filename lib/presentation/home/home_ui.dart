import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zartek/injector.dart';
import 'package:zartek/presentation/home/bloc/home_bloc.dart';
import 'package:zartek/presentation/home/ui/home_screen.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(authentication: injector(), homeRepo: injector())
            ..add(HomeLoadUserEvent()),
      child: const HomeScreen(),
    );
  }
}
