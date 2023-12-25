import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 100),
      onPressed: () => onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5.w, color: AppTheme.colors.primary),
            color: AppTheme.colors.primary.withOpacity(0.05),
            shape: BoxShape.circle),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
