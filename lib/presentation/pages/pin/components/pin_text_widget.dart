import 'package:flutter/material.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class PinTextWidget extends StatelessWidget {
  const PinTextWidget({
    super.key, required this.check, required this.errorBorder,
  });
  final bool check;
  final bool errorBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.5, color: errorBorder? AppTheme.colors.red:AppTheme.colors.primary)),
      child: Visibility(
        visible: check,
        child: Center(
          child: Container(
            height: ScreenSize.h14,
            width: ScreenSize.h14,
            decoration: BoxDecoration(
              color: errorBorder? AppTheme.colors.red:AppTheme.colors.primary,
              shape: BoxShape.circle
            ),
          ),
        ),
      )
    );
  }
}
