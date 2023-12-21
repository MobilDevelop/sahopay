import 'package:flutter/material.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/history/history_item.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

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
              Text(tr("history.amount"),style: AppTheme.data.textTheme.headlineMedium),
              Text("${item.amount} ${item.senderCurrency}",style: AppTheme.data.textTheme.titleSmall),
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
          Gap(ScreenSize.h4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text (tr("history.date"),style: AppTheme.data.textTheme.displaySmall),
              Text(Helper.dateTimeFormat(item.date),style: AppTheme.data.textTheme.titleSmall),
            ],
          ),
          Gap(ScreenSize.h14),
         Text( tr("history.comment"),style: AppTheme.data.textTheme.displaySmall),
         Gap(ScreenSize.h6),
         Text(item.comment,style: AppTheme.data.textTheme.titleSmall)
        ],
      ),
    );
  }
}