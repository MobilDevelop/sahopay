import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class CircleUserWidget extends StatelessWidget {
  const CircleUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenSize.h12),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.colors.primary,
          width: 2
        ),
        shape: BoxShape.circle
      ),
      child: SvgPicture.asset(AppIcons.user,height: 45.h,fit: BoxFit.cover,color:AppTheme.colors.primary,));
  }
}