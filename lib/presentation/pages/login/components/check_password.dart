import 'package:flutter/material.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

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
    Text( tr('login_page.wesend') ,style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text( tr('login_page.enteryour'),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
      ],
    );
  }
}