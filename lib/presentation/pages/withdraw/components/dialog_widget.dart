import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/infrastructure/models/withdraw/withdraw_response.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class DialogWidgetWithdraw extends StatelessWidget {
  const DialogWidgetWithdraw({
    super.key, required this.item,
  });
  final WithdrawResponse item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 200.h,
      child: Column(
        children: [
          Text("Payed Successfully",style: AppTheme.data.textTheme.displaySmall),
          Gap(ScreenSize.h20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("history.amount"),style: AppTheme.data.textTheme.headlineMedium),
              Text("${item.amount}",style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
          Gap(ScreenSize.h4),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("history.sender"),style: AppTheme.data.textTheme.displaySmall),
              Text(item.sender,style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
          Gap(ScreenSize.h4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("history.reciever"),style: AppTheme.data.textTheme.displaySmall),
              Text(item.recipient,style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
          Gap(ScreenSize.h4),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("history.pc"),style: AppTheme.data.textTheme.displaySmall),
              Text(item.pc,style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}