import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key, required this.title, required this.icon, required this.press, required this.onPress,this.size, required this.type,
  });
  final String title;
  final String icon;
  final VoidCallback press;
  final bool onPress;
  final String? size;
  final int type;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Bounce(
            duration: const Duration(milliseconds: 300),
            onPressed: press,
            child: Container(
              height: double.maxFinite, 
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppTheme.colors.white.withOpacity(.6),
                borderRadius: type==1?BorderRadius.only(topLeft: Radius.circular(16.r),bottomLeft: Radius.circular(16.r)):
                type==2? BorderRadius.only(topRight: Radius.circular(16.r),bottomRight: Radius.circular(16.r)):
                BorderRadius.circular(0)
              ),
              child: Column(
                mainAxisAlignment: onPress? MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
                children: [
                  Container(
                    height: ScreenSize.h4,
                    width: onPress? 50.w:0,
                    margin: EdgeInsets.symmetric(horizontal: ScreenSize.w4),
                    decoration: BoxDecoration(
                    color: AppTheme.colors.primary,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r))
                    ),
                  ),
                  Column(
                    children: [
                  SvgPicture.asset(icon,
                  color: onPress?AppTheme.colors.primary:AppTheme.colors.grey,
                  height: 25.h),
                  Text(title,
                  maxLines: 1,
                  style: onPress?AppTheme.data.textTheme.bodySmall!.copyWith(color:AppTheme.colors.primary):
                  AppTheme.data.textTheme.bodySmall!.copyWith(color:AppTheme.colors.grey)),
                    Visibility(
                      visible: onPress,
                      child: Gap(ScreenSize.h6)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: onPress,
            child: Container(
                decoration: BoxDecoration(
              borderRadius: type==1?BorderRadius.only(bottomLeft: Radius.circular(16.r)):
              type==2?BorderRadius.only(bottomRight: Radius.circular(16.r)):
              BorderRadius.circular(0),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppTheme.colors.primary.withOpacity(.25),
                  AppTheme.colors.primary.withOpacity(.02),
                  AppTheme.colors.primary.withOpacity(.007),
              ])
            ),
          ),
        )]
      ),
    );
  }
}