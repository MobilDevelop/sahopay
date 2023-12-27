import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class WithdrawWalletWidget extends StatelessWidget {
  const WithdrawWalletWidget({
    super.key, this.wallet, required this.press,
  });
  final WalletObject? wallet;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( tr('universal.yourwallet'),style: AppTheme.data.textTheme.bodyMedium),
        Gap(ScreenSize.h4),
        InkWell(
          onTap: press,
          child: Container(
          height: 45.h,
           width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
           decoration: BoxDecoration(
            border: Border.all(
             color: AppTheme.colors.primary,
             ),
              borderRadius: BorderRadius.circular(10.r)
             ),
           child: wallet==null?Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr('universal.chooseyourwallet'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey)),
                Icon(Icons.arrow_drop_down,size: ScreenSize.h20,color: AppTheme.colors.grey),
            ],
           ): Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
             Container(
               height: 35.h,
               width: 35.h,
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
              ),
          ),
        ),
      ],
    );
  }
}