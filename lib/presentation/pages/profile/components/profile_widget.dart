import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.title,
    required this.controller,

  });

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenSize.w12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),
          Gap(ScreenSize.h4),
          Container(
            height: 45.h,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.colors.primary
              ),
              borderRadius: BorderRadius.circular(15.r)
            ),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none
              ),
            ),
          )],
      ),
    );
  }
}