import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class DepositWriteWidget extends StatelessWidget {
  const DepositWriteWidget({
    super.key, required this.title,
  });
  final String title;
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
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.primary,
            ),
            borderRadius: BorderRadius.circular(10.r)
          ),
        ),
      ],
    );
  }
}
