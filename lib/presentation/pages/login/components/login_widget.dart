import 'package:flutter/material.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Gap(ScreenSize.h14),
    Text(tr('login_page.hi'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text(tr('login_page.credentials'),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
    Gap(ScreenSize.h4),
    Text(tr('login_page.signemail'),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
      ],
    );
  }
}