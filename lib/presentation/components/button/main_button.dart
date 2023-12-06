
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.showLoading = false,
    this.margin,
    this.leftIcon,
    this.wrap = false,  this.color,  this.textColor,
  }) : super(key: key);

  final String text;
  final String? leftIcon;
  final VoidCallback onPressed;
  final bool showLoading;
  final bool wrap;
  final EdgeInsets? margin;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Widget current;

    if (showLoading) {
      current = LoadingAnimationWidget.fallingDot(
        color: AppTheme.colors.white,
        size: 36.h,
      );
    } else if (leftIcon != null) {
      current = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(leftIcon!,color: textColor??AppTheme.colors.white,height: ScreenSize.h24),
          Gap(ScreenSize.w10),
          Text(
            text,
            style: AppTheme.data.textTheme.displaySmall
                ?.copyWith(color: textColor?? AppTheme.colors.white),
          )
        ],
      );
    } else {
      current = Text(
        text,
        style: AppTheme.data.textTheme.displaySmall
            ?.copyWith(color: textColor?? AppTheme.colors.white),
      );
    }

    return Bounce(
      onPressed:  onPressed,
      duration: const Duration(milliseconds: 150),
      child: Container(
        width: wrap ? null : double.infinity,
        height: wrap ? null : 40.h,
        alignment: Alignment.center,
        padding: wrap
            ? EdgeInsets.symmetric(
                horizontal: ScreenSize.w16,
                vertical: ScreenSize.h8,
              )
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: color ?? AppTheme.colors.primary,
          boxShadow: [
            BoxShadow(
              color: AppTheme.colors.grey,
              blurRadius: 10,
              spreadRadius: 4,
              offset: Offset(5.w, 6.h)
            )
          ],
        ),
        margin: margin,
        child: current,
      ),
    );
  }
}
