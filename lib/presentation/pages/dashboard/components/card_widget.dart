import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';
import 'package:sahopay/presentation/components/button/text_button_x.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 140.h,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: ScreenSize.w14,right: ScreenSize.w12, top: ScreenSize.h10,bottom: ScreenSize.h4),
      margin: EdgeInsets.only(bottom: ScreenSize.h20),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.colors.black,
          width: .5
        ),
        boxShadow: [
            BoxShadow(
              color: AppTheme.colors.grey.withOpacity(.7),
              blurRadius: 16,
              spreadRadius: 6,
              offset: Offset(5.w, 5.h)
            )
          ],
        borderRadius: BorderRadius.circular(10.r),
        image: const DecorationImage(image: AssetImage(AppIcons.card),fit: BoxFit.fill)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
            height: ScreenSize.h32,
            width: ScreenSize.h32,
            decoration: BoxDecoration(
              color: AppTheme.colors.primary,
              borderRadius: BorderRadius.circular(6.r)
            ),
          ),
          title: Text(tr('dashboard.number'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.white)),
          subtitle: Text("U0000126",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.white)),
          ),
          Gap(ScreenSize.h6),
          Text(tr('dashboard.balance'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.white)),
          Text("USDT 16.79",style: AppTheme.data.textTheme.headlineMedium!.copyWith(color: AppTheme.colors.white)),
          Gap(ScreenSize.h6),
          DottedLine(dashColor: AppTheme.colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             TextButtonX(onPressed: (){}, text: tr('home.transfer'),leftIcon:AppIcons.send,textColor: AppTheme.colors.black25),
             Container(
              width: 1,
              height: ScreenSize.h10,
              color: AppTheme.colors.white,
             ),
             TextButtonX(onPressed: (){}, text: tr('home.deposit'),leftIcon:AppIcons.money,textColor: AppTheme.colors.black25),
               Container(
              width: 1,
              height: ScreenSize.h10,
              color: AppTheme.colors.white,
             ),
             TextButtonX(onPressed: (){}, text: tr('home.withdraw'),leftIcon:AppIcons.withdraw,textColor: AppTheme.colors.black25),
              // Bounce(
              //   duration: const Duration(milliseconds: 300),
              //   onPressed: (){},
              //   child: Container(
              //     height: ScreenSize.h24,
              //     width: 100.w,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: AppTheme.colors.primary.withOpacity(.9),
              //       borderRadius: BorderRadius.circular(5.r)
              //     ),
              //     child: Text(tr('home.transfer'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.white)),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}