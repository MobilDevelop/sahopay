import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class DepositWriteWidget extends StatelessWidget {
  const DepositWriteWidget({
    super.key, required this.title, required this.controller, required this.hint, required this.icon,
  });
  final String title;
  final String hint;
  final TextEditingController controller;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTheme.data.textTheme.bodyMedium),
        Gap(ScreenSize.h4),
        Container(
          height: 36.h,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal:ScreenSize.w6,vertical: ScreenSize.h4),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.primary,
            ),
            borderRadius: BorderRadius.circular(10.r)
          ),
         child: TextField(
           controller: controller,
           decoration:  InputDecoration(
            prefixIcon:  Visibility(
              visible: icon.isNotEmpty,
              child: SvgPicture.asset(icon,height: ScreenSize.h14)),
            hintText: hint,
            contentPadding: const EdgeInsets.all(0),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none
           ),
         ), 
        ),
      ],
    );
  }
}