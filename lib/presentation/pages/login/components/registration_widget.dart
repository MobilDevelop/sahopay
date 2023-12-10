import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    Gap(ScreenSize.h8),
    Text("Hi Welcome",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text("Sign up with Email address",style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
    ],
    );
  }
}