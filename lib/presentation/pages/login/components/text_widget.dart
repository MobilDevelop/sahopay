import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key, required this.controller, required this.title,
     });
    final TextEditingController controller;
    final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
       title,
        style: AppTheme.data.textTheme.bodyLarge!
            .copyWith(color: AppTheme.colors.black),
      ),
      Gap(ScreenSize.h6),
      SizedBox(
        height: 50.h,
        child: TextField(
          controller: controller,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppTheme.colors.black),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: 13.h, horizontal: ScreenSize.w16),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.r),
                  borderSide: BorderSide(
                      width: 1.5, color: AppTheme.colors.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.r),
                  borderSide: BorderSide(
                      width: 1.5, color: AppTheme.colors.primary))),
        ),
      )
    ]);
  }
}