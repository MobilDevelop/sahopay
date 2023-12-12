import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class BottomsheetWidget1 extends StatelessWidget {
  const BottomsheetWidget1({
    super.key, required this.selected, required this.icon, required this.title, required this.press,
  });
  final bool selected;
  final String icon;
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Expanded(
                child: Bounce(
                  duration: const Duration(milliseconds: 300),
                  onPressed: press,
                  child: Container(
                    height: 30.h,
                     padding: EdgeInsets.only(left: ScreenSize.w6),
                    decoration: BoxDecoration(
                      color: selected?AppTheme.colors.primary:AppTheme.colors.white,
                      border: Border.all(
                        color: AppTheme.colors.grey
                      ),
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(icon,color: selected?AppTheme.colors.white:AppTheme.colors.black,height: ScreenSize.h18),
                        Text(title,style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: selected?AppTheme.colors.white:AppTheme.colors.black))
                      ],
                    ),  
                  ),
                ),
              );
  }
}