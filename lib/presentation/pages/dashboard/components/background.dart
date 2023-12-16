

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      margin: EdgeInsets.all(.5.h),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Transform.translate(offset: Offset(0, 0),
          child: Container(
            height: 90.h,
            width: 90.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue
            ),
          ),
          ),
          Transform.translate(offset: Offset(0, 0),
          child: Container(
            height: 105.h,
            width: 105.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red
            ),
          ),
          )
        ],
      )
    );
  }
}