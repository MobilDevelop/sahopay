import 'package:flutter/material.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class PinTextWidget extends StatelessWidget {
  const PinTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 32.w,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(width: 1.w, color: AppTheme.colors.primary)),
      child: Center(
        child: Text(
          "_",
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  }
}
