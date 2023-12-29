import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';
import 'package:sahopay/presentation/components/button/text_button_x.dart';
class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key, required this.item, required this.index, required this.backgroundColor, required this.onPress,
  });
  final DashboardModel item;
  final int index;
  final List<Color> backgroundColor;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(bottom: ScreenSize.h20,left: ScreenSize.w12,right: ScreenSize.w12),
      padding: EdgeInsets.symmetric(vertical: ScreenSize.h4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: backgroundColor),
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
      child: Container(
         padding: EdgeInsets.only(left: ScreenSize.w14,right: ScreenSize.w12, top: ScreenSize.h10,bottom: ScreenSize.h4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Container(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(ScreenSize.h4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.colors.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: AppTheme.colors.white,
                  width: 1.5
                )
              ),
            child:Image.network(AppContatants.imageUrl+item.logoUrl,
            color: AppTheme.colors.primary,
        errorBuilder: (context, error, stackTrace) =>SvgPicture.asset(AppIcons.cardSvg,color: AppTheme.colors.primary,height: ScreenSize.h24)), 
            ),
            title: Text(tr('dashboard.number'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.white12)),
            subtitle: Text(item.account,style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.white12)),
            ),
            Gap(ScreenSize.h6),
            Text(tr('dashboard.balance'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.white12)),
            Text("${item.currencyName} ${item.balance}",style: AppTheme.data.textTheme.headlineMedium!.copyWith(color: AppTheme.colors.white12)),
            Gap(ScreenSize.h6),
            DottedLine(dashColor: AppTheme.colors.white12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               TextButtonX(onPressed: ()=>onPress(1), text: tr('home.transfer'),leftIcon:AppIcons.send,textColor: AppTheme.colors.white12),
               Container(
                width: 1,
                height: ScreenSize.h10,
                color: AppTheme.colors.white12,
               ),
               TextButtonX(onPressed: ()=>onPress(2), text: tr('home.deposit'),leftIcon:AppIcons.money,textColor: AppTheme.colors.white12),
                 Container(
                width: 1,
                height: ScreenSize.h10,
                color: AppTheme.colors.white12,
               ),
               TextButtonX(onPressed: ()=>onPress(3), text: tr('home.withdraw'),leftIcon:AppIcons.withdraw,textColor: AppTheme.colors.white12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}