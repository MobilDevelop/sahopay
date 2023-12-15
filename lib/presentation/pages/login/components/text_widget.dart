import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key, required this.controller, required this.title, required this.border, required this.visible, required this.showText, required this.overflow, required this.hintText,
     });
    final TextEditingController controller;
    final String title;
    final bool border;
    final bool visible;
    final VoidCallback showText;
    final bool overflow;
    final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
       title,
        style: AppTheme.data.textTheme.bodyLarge!
            .copyWith(color: border?AppTheme.colors.black25:AppTheme.colors.primary),
      ),
      Gap(ScreenSize.h6),
      Container(
        margin: EdgeInsets.only(bottom: ScreenSize.h4),
        child: TextField(
          controller: controller,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppTheme.colors.black),
              obscureText: overflow, 
          decoration: InputDecoration(
             suffixIcon: Visibility(
              visible:  visible,
              child: IconButton(onPressed:showText, icon:overflow?const Icon(Icons.visibility_off_outlined):const Icon(Icons.remove_red_eye_outlined))),
              fillColor: border?AppTheme.colors.red.withOpacity(.05):AppTheme.colors.white,
              suffixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? AppTheme.colors.black
                : AppTheme.colors.grey),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 13.h, horizontal: ScreenSize.w16),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.r),
                  borderSide: BorderSide(
                      width: 1.5, color: border?AppTheme.colors.red:AppTheme.colors.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.r),
                  borderSide: BorderSide(
                      width: 1.5, color:border?AppTheme.colors.red:AppTheme.colors.primary))),
        ),
      ),
      Visibility(
        visible: border,
        child: Text(
         hintText,
          style: AppTheme.data.textTheme.labelSmall!
              .copyWith(color: AppTheme.colors.red),
        ),
      ),
      Gap(ScreenSize.h10)
    ]);
  }
}