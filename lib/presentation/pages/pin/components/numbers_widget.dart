import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({
    super.key,
    required this.title,
    required this.onTap, this.icon,
  });

  final String title;
  final Function onTap;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: () => onTap(title),
      child: title.isEmpty?SizedBox(
        height: 55.h,
        width: 55.h,
      ): Container(
        height: 55.h,
        width: 55.h,
        decoration: BoxDecoration(
            border: Border.all(width: 0.5.w, color: AppTheme.colors.primary),
            color: AppTheme.colors.primary.withOpacity(0.05),
            shape: BoxShape.circle),
        child: icon==null? Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        )):Center(child: SvgPicture.asset(icon!, height: 30.h, width: 30.h)),
      ),
    );
  }
}
