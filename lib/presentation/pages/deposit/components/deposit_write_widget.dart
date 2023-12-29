import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class DepositWriteWidget extends StatelessWidget {
  const DepositWriteWidget({
    super.key, required this.title, required this.controller, required this.hint, required this.icon, required this.hint2, required this.errorBoder, required this.enebled,
  });
  final String title;
  final String hint;
  final TextEditingController controller;
  final String icon;
  final String hint2;
  final bool errorBoder;
  final bool enebled;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTheme.data.textTheme.bodyMedium),
        Gap(ScreenSize.h4),
        TextField(
          controller: controller,
          decoration:  InputDecoration(
           enabled: enebled,
           hintText: hint,
           contentPadding:  EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
           enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10.r),
             borderSide: BorderSide(
               color: errorBoder?AppTheme.colors.red:AppTheme.colors.primary,
               width: errorBoder?2:1
             )
           ),
           disabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10.r),
             borderSide: BorderSide(
               color: errorBoder?AppTheme.colors.red:AppTheme.colors.primary,
               width: errorBoder?2:1
             )
           ),
           focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10.r),
             borderSide: BorderSide(
               color: errorBoder?AppTheme.colors.red:AppTheme.colors.primary,
               width: errorBoder?2:1
             )
           ),
          ),
        ),
        Gap(ScreenSize.h4),
         Visibility(
          visible: errorBoder,
          child: Text(hint2,style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red))),
      ],
    );
  }
}
