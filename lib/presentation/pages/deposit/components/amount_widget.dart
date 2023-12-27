import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class DepositAmountWidget extends StatelessWidget {
  const DepositAmountWidget({
    super.key, required this.title, required this.controller, required this.hint,required this.hint2, required this.errorBoder, required this.enebled, required this.onChanged,
  });
  final String title;
  final String hint;
  final TextEditingController controller;
  final VoidCallback onChanged;

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
          keyboardType: TextInputType.number,
          onChanged: (value) => onChanged(),
          decoration:  InputDecoration(
           enabled: enebled,
           hintText: hint,
           contentPadding:  EdgeInsets.symmetric(horizontal: ScreenSize.w10),
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
