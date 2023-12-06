import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/button/border_button.dart';

class BottomsheetWidget extends StatelessWidget {
  const BottomsheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 400.h,
              width: double.maxFinite,
              padding: EdgeInsets.only(left: ScreenSize.w10,right: ScreenSize.w10,bottom: ScreenSize.h32),
              decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r))
    ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
        Column(
          children: [
            Gap(ScreenSize.h10),
             Container(
            height: ScreenSize.h4,
            width: 130.w,
            decoration: BoxDecoration(
              color: AppTheme.colors.black,
              borderRadius: BorderRadius.circular(4.r)
            ),
          ),
          Gap(ScreenSize.h24),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.w6,vertical: ScreenSize.h6),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.colors.primary
              ),
              borderRadius: BorderRadius.circular(12.r)
            ),
            child: Column(
              children: [
              typeView("Transactions", AppIcons.bag,true),
              Gap(ScreenSize.h10),
              typeView("Exchanges", AppIcons.exchange2,false),
              Gap(ScreenSize.h10),
              typeView("Referals", AppIcons.referal,false),
              ],
            ),
          ),
          Gap(ScreenSize.h32),
          Row(
            children: [
              typeWidget(" All", AppIcons.bag,false),
              Gap(ScreenSize.w8),
              typeWidget(" Dollor", AppIcons.dollar,true),
               Gap(ScreenSize.w8),
              typeWidget(" Euro", AppIcons.euro,false),
               Gap(ScreenSize.w8),
              typeWidget(" Ruble", AppIcons.ruble,false),
              
            ],
          ),
          ],
        ),
          Row(
            children: [
              Expanded(child: BorderButton(onPressed: (){Navigator.pop(context);}, text: "Cancel",borderColor: AppTheme.colors.red)),
              Gap(ScreenSize.w10),
              Expanded(child: BorderButton(onPressed: (){}, text: "OK",borderColor: AppTheme.colors.green)),
            ],
          )
    ],
      ),
     );
  }
  Widget typeWidget(String title,String icon,bool selected){
    return Expanded(
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
              );
  }

  Widget typeView(String title,String icon,bool selected){
    return Container(
                height: 45.h,
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
                    children: [
                      SvgPicture.asset(icon,color: selected?AppTheme.colors.white:AppTheme.colors.black,height: ScreenSize.h24),
                      Gap(ScreenSize.w10),
                      Text(title,style: AppTheme.data.textTheme.displaySmall!.copyWith(color: selected?AppTheme.colors.white:AppTheme.colors.black))
                    ],
                  ),  
              );
  }
}