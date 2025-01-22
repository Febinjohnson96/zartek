import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';
import 'package:zartek/core/routes/route_name.dart';
import 'package:zartek/core/utils/applogger.dart';
import 'package:zartek/gen/assets.gen.dart';
import 'package:zartek/presentation/auth/bloc/auth_bloc.dart';
import 'package:zartek/presentation/widgets/app_scaffold.dart';
import 'package:zartek/presentation/widgets/google_auth_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go(RouteName.home);
          } else if (state is AuthError) {
            AppLogger.errorlog("Error");
            Toast.show(
              "Some Error Occured",
            );
          } else if (state is AuthLoading) {
            const CircularProgressIndicator();
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.images.firebase.path,
                  height: 200.h, width: 200.w),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                  width: 500.w,
                  height: 50.h,
                  child: GoogleAuthenticationButton(
                    buttonTitle: 'Google',
                    onTap: () =>
                        context.read<AuthBloc>().add(GoogleAuthEvent()),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
