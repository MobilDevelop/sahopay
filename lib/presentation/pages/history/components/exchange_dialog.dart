import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/history/get_exchange.dart.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class ExchangeDialogWidget extends StatelessWidget {
  const ExchangeDialogWidget({
    super.key, required this.item,
  });
  final HistoryExchange item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w14),
      child: Column(
        children: [
          Text(item.trasactionStatus=="WAITING"?tr("history.waiting1"):
          item.trasactionStatus=="SUCCESS"?tr("history.succes"):tr("history.error"),style: AppTheme.data.textTheme.displaySmall),
          Gap(ScreenSize.h20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("history.amount"),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
              Row(
                children: [
                  Text("${item.amount}${item.senderCurrency}",style: AppTheme.data.textTheme.labelSmall),
                  Gap(2.w),
                   SvgPicture.asset(AppIcons.exchange3,color: AppTheme.colors.primary,height: ScreenSize.h12),
                  Gap(2.w),
                  Text("${item.conversionAmount} ${item.recipientCurrency}",style: AppTheme.data.textTheme.labelSmall),
                ],
              ),
            ],
          ),
          Gap(ScreenSize.h4),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("history.sender"),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
              Text(item.sender,style: AppTheme.data.textTheme.labelSmall),
            ],
          ),
          Gap(ScreenSize.h4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("history.reciever"),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
              Text(item.recipient,style: AppTheme.data.textTheme.labelSmall),
            ],
          ),
          Gap(ScreenSize.h4),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr("history.pc"),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
              Text(item.pc,style: AppTheme.data.textTheme.labelSmall),
            ],
          ),
          Gap(ScreenSize.h4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text (tr("history.date"),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
              Text(Helper.dateTimeFormat(item.date),style: AppTheme.data.textTheme.labelSmall),
            ],
          ),
          Gap(ScreenSize.h8),
         Visibility(
          visible: item.comment.isNotEmpty,
           child: Row(
             children: [
               Text( tr("history.comment"),
               style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
               Gap(ScreenSize.w14),
               Expanded(child: Text(item.comment,
               textAlign: TextAlign.end,
               style: AppTheme.data.textTheme.labelSmall))
             ],
           ),
         ),
        ],
      ),
    );
  }
}