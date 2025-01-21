import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zartek/gen/assets.gen.dart';
import 'package:zartek/presentation/widgets/app_scaffold.dart';
import 'package:zartek/presentation/widgets/google_auth_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
                child: GoogleAuthenticationButton(buttonTitle: 'Google'))
          ],
        ),
      ),
    );
  }
}
