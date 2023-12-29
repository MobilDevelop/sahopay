import 'package:flutter/material.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Gap(ScreenSize.h32),
    Text(tr('login_page.reset'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text((tr('login_page.resetwith')),textAlign: TextAlign.center ,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey)),
     Gap(ScreenSize.h32),
      ],
    );
  }
}