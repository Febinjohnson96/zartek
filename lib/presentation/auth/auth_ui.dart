import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zartek/injector.dart';
import 'package:zartek/presentation/auth/bloc/auth_bloc.dart';
import 'package:zartek/presentation/auth/ui/auth_screen.dart';

class AuthUi extends StatelessWidget {
  const AuthUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(authentication: injector()),
      child: const AuthScreen(),
    );
  }
}
