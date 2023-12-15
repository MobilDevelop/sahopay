import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class CheckPasswordWidget extends StatelessWidget {
  const CheckPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Gap(ScreenSize.h32),
    Gap(ScreenSize.h32),
    Text("We send 6 digits to your email",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text("Enter your new password",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
      ],
    );
  }
}