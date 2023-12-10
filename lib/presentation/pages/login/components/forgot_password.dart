import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Gap(ScreenSize.h32),
    Text("Reset Password",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text("Reset password with Email address",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey)),
     Gap(ScreenSize.h32),
      ],
    );
  }
}