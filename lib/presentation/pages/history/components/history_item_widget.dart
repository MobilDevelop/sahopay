import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/history/get_transactions.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({
    super.key, required this.press, required this.item,
  });
  final Function press;
  final HistoryTransaction item;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 300),
      onPressed:()=> press(item),
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
              
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sender:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                          Text(item.sender,style: AppTheme.data.textTheme.titleSmall),
                        ],
                      ),
                      Text(Helper.timeFormat(item.date),textAlign: TextAlign.end,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey)),
                    ],
                  ),
                ),
              ],
            ), 
            Gap(ScreenSize.h6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text("Receiver:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                    Text(item.recipient,style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.black)),
                  ],
                ),
                Text( "${item.transactionType}${item.amount} ${item.senderCurrency}",textAlign: TextAlign.end,
                style: AppTheme.data.textTheme.titleSmall!.copyWith(color: item.transactionType=="-"? AppTheme.colors.red:AppTheme.colors.green)),
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
                    color: item.trasactionStatus==tr("history.waiting")? AppTheme.colors.yellow.withOpacity(.1):AppTheme.colors.green.withOpacity(.1),
                    border: Border.all(
                      color: item.trasactionStatus==tr("history.waiting")? AppTheme.colors.yellow:AppTheme.colors.green,
                      width: .7
                    ),
                  borderRadius: BorderRadius.circular(8
                  .r) 
                  ),
                  child: Text(item.trasactionStatus,textAlign: TextAlign.end,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black))),
              ],
            )
          ],
        ),
      ),
    );
  }
}