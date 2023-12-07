import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key, required this.title, required this.icon, required this.press, required this.onPress,this.size,
  });
  final String title;
  final String icon;
  final VoidCallback press;
  final bool onPress;
  final String? size;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Bounce(
            duration: const Duration(milliseconds: 300),
            onPressed: press,
            child: Column(
              mainAxisAlignment: onPress? MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
              children: [
                Container(
                  height: ScreenSize.h4,
                  width: onPress? 40.w:0,
                  margin: EdgeInsets.symmetric(horizontal: ScreenSize.w4),
                  decoration: BoxDecoration(
                  color: AppTheme.colors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r)
                  )
                  ),
                ),
                Column(
                  children: [
                SvgPicture.asset(icon,
                color: onPress?AppTheme.colors.primary:AppTheme.colors.grey,
                height: 25.h),
                Visibility(
                  visible: onPress,
                  child: Text(title,
                  maxLines: 1,
                  style: AppTheme.data.textTheme.bodySmall!.copyWith(color:AppTheme.colors.primary))),
                  Gap(ScreenSize.h6),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: onPress,
            child: Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppTheme.colors.primary.withOpacity(.18),
                  AppTheme.colors.primary.withOpacity(.018),
                  AppTheme.colors.primary.withOpacity(.005),
                ])
            ),
              ),
          )
        ],
      ),
    );
  }
}