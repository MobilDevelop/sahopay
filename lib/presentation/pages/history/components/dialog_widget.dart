import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/history/history_item.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key, required this.item,
  });
  final HistoryItem item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w14),
      child: Column(
        children: [
          Text(item.trasactionStatus=="WAITING"?"Error":"Success",style: AppTheme.data.textTheme.displaySmall),
          Gap(ScreenSize.h20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Amount",style: AppTheme.data.textTheme.headlineMedium),
              Text("${item.amount} ${item.senderCurrency}",style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
          Gap(ScreenSize.h4),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sender",style: AppTheme.data.textTheme.displaySmall),
              Text(item.sender,style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
          Gap(ScreenSize.h4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Reciever",style: AppTheme.data.textTheme.displaySmall),
              Text(item.recipient,style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
          Gap(ScreenSize.h4),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("PS",style: AppTheme.data.textTheme.displaySmall),
              Text(item.pc,style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
          Gap(ScreenSize.h4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Date",style: AppTheme.data.textTheme.displaySmall),
              Text(Helper.dateTimeFormat(item.date),style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
          Gap(ScreenSize.h14),
         Text("Comment",style: AppTheme.data.textTheme.displaySmall),
         Gap(ScreenSize.h6),
         Text(item.comment,style: AppTheme.data.textTheme.titleSmall)
        ],
      ),
    );
  }
}