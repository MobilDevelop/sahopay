import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';
import 'package:sahopay/presentation/components/button/text_button_x.dart';
import 'package:sahopay/presentation/pages/dashboard/components/background.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key, required this.item,
  });
  final DashboardModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.maxFinite,
      margin: EdgeInsets.only(bottom: ScreenSize.h20,left: ScreenSize.w12,right: ScreenSize.w12),
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
        
      ),
      child: Stack(
        children: [
          Background(),
          Container(
             padding: EdgeInsets.only(left: ScreenSize.w14,right: ScreenSize.w12, top: ScreenSize.h10,bottom: ScreenSize.h4),
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
                 // child: Image.network(AppContatants.imageUrl+item.logoUrl,color: AppTheme.colors.white,)
                ),
                title: Text(tr('dashboard.number'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.white12)),
                subtitle: Text(item.account,style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.white12)),
                ),
                Gap(ScreenSize.h6),
                Text(tr('dashboard.balance'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.white12)),
                Text("${item.currensyName} ${item.balance}",style: AppTheme.data.textTheme.headlineMedium!.copyWith(color: AppTheme.colors.white12)),
                Gap(ScreenSize.h6),
                DottedLine(dashColor: AppTheme.colors.white12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   TextButtonX(onPressed: (){}, text: tr('home.transfer'),leftIcon:AppIcons.send,textColor: AppTheme.colors.white12),
                   Container(
                    width: 1,
                    height: ScreenSize.h10,
                    color: AppTheme.colors.white12,
                   ),
                   TextButtonX(onPressed: (){}, text: tr('home.deposit'),leftIcon:AppIcons.money,textColor: AppTheme.colors.white12),
                     Container(
                    width: 1,
                    height: ScreenSize.h10,
                    color: AppTheme.colors.white12,
                   ),
                   TextButtonX(onPressed: (){}, text: tr('home.withdraw'),leftIcon:AppIcons.withdraw,textColor: AppTheme.colors.white12),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}