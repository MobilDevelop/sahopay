import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class ExchangeItemWidget extends StatelessWidget {
  const ExchangeItemWidget({
    super.key, required this.items, required this.wallet, required this.press, required this.title, required this.hint, required this.borderColor, required this.errorText,
  });
  final List<WalletObject> items;
  final WalletObject? wallet;
  final Function press;
  final String title;
  final String hint;
  final bool borderColor;
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTheme.data.textTheme.bodyMedium),
         Gap(ScreenSize.h4),
        Bounce(
          duration: Duration(milliseconds: AppContatants.duration),
          onPressed:()=> press(),
          child: Container(
            height: 45.h,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor? AppTheme.colors.red:AppTheme.colors.primary,
                width: borderColor?2:1
              ),
              borderRadius: BorderRadius.circular(10.r)
            ),
            child: wallet==null?Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hint,style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                Icon(Icons.arrow_drop_down,size: ScreenSize.h20,color: AppTheme.colors.grey),
              ],
            ):Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
               Container(
                 height: 35.h,
                 width: 35.h,
                 padding: EdgeInsets.all(ScreenSize.h4),
                 decoration: BoxDecoration(
             border: Border.all(
               color: AppTheme.colors.grey
             ),
             borderRadius: BorderRadius.circular(10.r)
                 ),
                 child: Image.network(AppContatants.imageUrl+wallet!.logoUrl,errorBuilder: (context, error, stackTrace) => Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SvgPicture.asset(AppIcons.cardSvg),
               ) ),
               ),
               Gap(ScreenSize.w16),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [ 
             Text(wallet!.account,style: AppTheme.data.textTheme.titleSmall),
             Text("${wallet!.balance} ${wallet!.currencyName}",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.black25)),
                 ],
               )   
                      ],
                    ),
                    Icon(Icons.arrow_drop_down,size: ScreenSize.h20,color: AppTheme.colors.grey),
                  ],
            )
          ),
        ),
        Visibility(
          visible: borderColor,
          child: Column(
            children: [
              Gap(ScreenSize.h4),
          Text(errorText,style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red)),
            ],
          ),
        )
         
      ],
    );
  }
}