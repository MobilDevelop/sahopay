import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Gap(ScreenSize.h14),
    Text("Hi Welcome Back",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text("Enter your credentials to continue",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
    Gap(ScreenSize.h4),
    Text("Sign in with Email address",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
      ],
    );
  }
}