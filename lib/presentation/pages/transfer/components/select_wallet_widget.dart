// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class SelectWalletWidget extends StatelessWidget {
  const SelectWalletWidget({
    super.key, required this.selectedWalletItem, required this.press,
  });

   final WalletObject? selectedWalletItem;
   final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr('universal.yourwallet'),style: AppTheme.data.textTheme.bodyMedium),
        Gap(ScreenSize.h4),
        InkWell(
          onTap: press,
          child: Container(
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
            child: selectedWalletItem==null? Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tr('universal.chooseyourwallet'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey),),
                  Icon(Icons.arrow_drop_down,size: ScreenSize.h24),
                ],
              ),
            ): Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                height: 33.h,
                width: 33.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppTheme.colors.grey.withOpacity(.6),
                    width: 1.5
                  ),
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Image.network(AppContatants.imageUrl+selectedWalletItem!.logoUrl,errorBuilder: (context, error, stackTrace) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.cardSvg),
                  ) ),
              ),
              Gap(ScreenSize.w14),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(selectedWalletItem!.account,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),
                  Text("${selectedWalletItem!.balance} ${selectedWalletItem!.currencyName}",
             style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.stroke)), 
                ],
              )
                  ],
                ),
               Icon(Icons.arrow_drop_down,color: AppTheme.colors.grey,size: ScreenSize.h20), 
              ],
            )
          ),
        ),
      ],
    );
  }
}