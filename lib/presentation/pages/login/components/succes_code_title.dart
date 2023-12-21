import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

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
    Text(tr('login_page.check'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
    Gap(ScreenSize.h4),
    Text(tr('login_page.wehave'),style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
    Gap(ScreenSize.h4),
    Text(tr('login_page.pleaseenter') ,style: AppTheme.data.textTheme.bodyLarge!.copyWith(color: AppTheme.colors.grey)),
      ],
    );
  }
}