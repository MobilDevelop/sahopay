import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({
    super.key, required this.press,
  });
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 300),
      onPressed: press,
      child: Container( 
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: ScreenSize.w12,vertical: ScreenSize.h10),
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.w12,vertical: ScreenSize.h12),
        decoration: BoxDecoration(
          color: AppTheme.colors.white,
          border: Border.all(
            color: AppTheme.colors.primary,
            width: .8
          ),
           boxShadow: [
        BoxShadow(
          color: AppTheme.colors.grey.withOpacity(.6),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(7.w, 6.h)
        )
      ], 
          borderRadius: BorderRadius.circular(15.r)
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 30.h,
                  width: 30.h,
                  margin: EdgeInsets.only(right: ScreenSize.h6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.colors.grey
                    ),
                    borderRadius: BorderRadius.circular(8.r)
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text("0xeb2d****c8a0bb",maxLines: 1,overflow: TextOverflow.ellipsis,style: AppTheme.data.textTheme.titleSmall)),
                      Expanded(
                        flex: 2,
                        child:Text(Helper.timeFormat(DateTime.now()),textAlign: TextAlign.end,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey))),
                    ],
                  ),
                ),
              ],
            ), 
            Gap(ScreenSize.h6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Text("U0000125",maxLines: 1,overflow: TextOverflow.ellipsis,style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey))),
                Expanded(
                  flex: 2,
                  child: Text("+5.7 USDT",textAlign: TextAlign.end,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.green))),
              ],
            ),
            Gap(ScreenSize.h8),
            DottedLine(dashColor: AppTheme.colors.grey),
            Gap(ScreenSize.h8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr('history.status'),textAlign: TextAlign.end,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h4),
                  decoration: BoxDecoration(
                    color: AppTheme.colors.green.withOpacity(.1),
                    border: Border.all(
                      color: AppTheme.colors.green,
                      width: .7
                    ),
                  borderRadius: BorderRadius.circular(8
                  .r) 
                  ),
                  child: Text("Succes",textAlign: TextAlign.end,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black))),
              ],
            )
          ],
        ),
      ),
    );
  }
}