import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class SuccesCodeTitle extends StatelessWidget {
  const SuccesCodeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Gap(ScreenSize.h32),
    Gap(ScreenSize.h32),
    Text("Please check your email!",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text("We have emailed a 6-digit confimation code to",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
    Gap(ScreenSize.h4),
    Text("please enter the code in below box to verify your email.",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
      ],
    );
  }
}