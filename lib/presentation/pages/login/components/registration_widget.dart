import 'package:flutter/material.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
    Gap(ScreenSize.h8),
    Text(tr('login_page.hiwelcome'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text( tr('login_page.signupemail'),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
    ],
    );
  }
}