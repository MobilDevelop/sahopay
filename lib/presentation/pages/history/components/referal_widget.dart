import 'package:flutter/material.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/history/get_referals.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class ReferalsWidget extends StatelessWidget {
  const ReferalsWidget({
    super.key, required this.item,
  });
  final HistoryReferals item;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("UserId:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                Gap(2.h),
                Text(item.userId,style: AppTheme.data.textTheme.titleSmall),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Referal userId:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                Gap(2.h),
                Text(item.referralUserId,style: AppTheme.data.textTheme.titleSmall),
              ],
            )
            ],
          ),
          Gap(ScreenSize.h20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Referal date:",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),  
              Text(Helper.dateTimeFormat(item.referaldate),style: AppTheme.data.textTheme.titleSmall),
            ],
          )
        ],
      ),  
    );
  }
}