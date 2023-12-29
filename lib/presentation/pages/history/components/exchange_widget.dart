import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/models/history/get_exchange.dart.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class ExchangeWidget extends StatelessWidget {
  const ExchangeWidget({
    super.key, required this.item, required this.press,
  });
  final HistoryExchange item;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: AppContatants.duration),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Sender:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                  Text(item.sender,style: AppTheme.data.textTheme.titleSmall),
                    ],
                  ),
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Text("Reciever:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                  Text(item.recipient,style: AppTheme.data.textTheme.titleSmall),
                    ],
                  ),
                  //Text(Helper.timeFormat(item.date),textAlign: TextAlign.end,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey)),
                ],
              ), 
               Gap(ScreenSize.h8),
              DottedLine(dashColor: AppTheme.colors.grey),
              Gap(ScreenSize.h8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Amount:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                      Text("${item.amount} ${item.senderCurrency}",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.black)),
                    ],
                  ),
                  SvgPicture.asset(AppIcons.exchange3,color: AppTheme.colors.primary),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Amount:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                      Text( "${item.conversionAmount} ${item.recipientCurrency}",
                      style: AppTheme.data.textTheme.titleSmall!.copyWith(color:AppTheme.colors.black)),
                    ],
                  ),
                ],
              ),
              Gap(ScreenSize.h4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rate:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                      Text("1 ${item.recipientCurrency}",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.black)),
                    ],
                  ),
                   SvgPicture.asset(AppIcons.exchange3,color: AppTheme.colors.primary),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Rate:",style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
                      Text( "${item.rate} ${item.senderCurrency}",
                      style: AppTheme.data.textTheme.titleSmall!.copyWith(color:AppTheme.colors.black)),
                    ],
                  ),
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