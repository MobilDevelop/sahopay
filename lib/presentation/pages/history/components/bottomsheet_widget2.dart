import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class BottomsheetWidget2 extends StatelessWidget {
  const BottomsheetWidget2({
    super.key, required this.selected, required this.icon, required this.title, required this.press, this.center,
  });
  final bool selected;
  final String icon;
  final String title;
  final VoidCallback press;
  final String? center;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 300),
      onPressed: press,
      child: Container(
                  height: 40.h,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                  decoration: BoxDecoration(
                    color: selected?AppTheme.colors.primary:AppTheme.colors.white,
                    border: Border.all(
                      color: AppTheme.colors.grey
                    ),
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Row(
                      mainAxisAlignment: center!=null?MainAxisAlignment.center:MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(icon,color: selected?AppTheme.colors.white:AppTheme.colors.black,height: ScreenSize.h24),
                        Gap(ScreenSize.w10),
                        Text(title,style: AppTheme.data.textTheme.displaySmall!.copyWith(color: selected?AppTheme.colors.white:AppTheme.colors.black))
                      ],
                    ),  
                ),
    );
  }
}