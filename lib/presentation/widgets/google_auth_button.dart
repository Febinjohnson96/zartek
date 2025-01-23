import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zartek/core/theme/apptypography.dart';
import 'package:zartek/gen/assets.gen.dart';

class GoogleAuthenticationButton extends StatelessWidget {
  const GoogleAuthenticationButton(
      {super.key, this.onTap, required this.buttonTitle});
  final VoidCallback? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: 341,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 40.h,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(Assets.vectors.googleicon),
                )),
            SizedBox(
              width: 20.w,
            ),
            Text(
              buttonTitle,
              style: AppTypography.sWayMedium16.copyWith(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
