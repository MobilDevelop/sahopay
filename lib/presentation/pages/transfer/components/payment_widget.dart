import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/transfer/payment.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class PaymentWidgetTransfer extends StatelessWidget {
  const PaymentWidgetTransfer({
    super.key,
    required this.payment,
  });

  final TransferPayment? payment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr('universal.payment'),style: AppTheme.data.textTheme.bodyMedium),
        Gap(ScreenSize.h4),
        Container(
           height: 45.h,
         width: double.maxFinite,
        padding: EdgeInsets.only(left: ScreenSize.w14,right: ScreenSize.h8),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
        color: AppTheme.colors.white,
        border: Border.all(
        color: AppTheme.colors.primary
            ),
        borderRadius: BorderRadius.circular(10.r) 
          ),
      child: payment==null?Container():Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
    Row(
      children: [
        Container(
              height: 33.h,
              width: 33.h,
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.h4),
              decoration: BoxDecoration(
                border: Border.all(
                color: AppTheme.colors.grey.withOpacity(.6),
                width: 1.5),
                borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: Image.network(AppContatants.imageUrl+payment!.logoUrl,errorBuilder: (context, error, stackTrace) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppIcons.cardSvg),
                      ) ),
                  ),
        Gap(ScreenSize.w14),
              Text(payment!.systemName,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),          
      ],
    ),
              Text("${Helper.toProcessCost(payment!.commission.toString())} %",
             style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.stroke)), 
                  ],
                ),
        ),
      ],
    );
  }
}
