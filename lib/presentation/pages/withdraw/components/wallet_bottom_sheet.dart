import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class WalletBottomSheet extends StatelessWidget {
  const WalletBottomSheet({
    super.key, required this.items, required this.onTap,
  });
  final List<WalletObject> items;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.h,
    padding: EdgeInsets.only(top: ScreenSize.h10),
    decoration: BoxDecoration(
     color: AppTheme.colors.background,
     borderRadius: BorderRadius.only(
     topLeft: Radius.circular(20.r),
    topRight: Radius.circular(20.r)
     )
      ),
     child: Column(
      children: [
         Container(
            height: 2.h,
            width: 100.w,
            decoration: BoxDecoration(
            color: AppTheme.colors.black,
            borderRadius: BorderRadius.circular(10.r)
            ),
          ),
          Gap(ScreenSize.h12),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(left: ScreenSize.w10),
            child: Text(tr('universal.chooseyourwallet'),style: AppTheme.data.textTheme.titleSmall)),
          Gap(ScreenSize.h16),
          Expanded(child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => onTap(items[index]),
              child: Column(
                children: [
                  Container(
                        margin: EdgeInsets.symmetric(vertical: ScreenSize.h8,horizontal: ScreenSize.w20),
                        child: Row(
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
                                      child: Image.network(AppContatants.imageUrl+items[index].logoUrl,errorBuilder: (context, error, stackTrace) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(AppIcons.cardSvg),
                                    ) ),
                                    ),
                                    Gap(ScreenSize.w16),
                                    Text(items[index].account,style: AppTheme.data.textTheme.titleSmall)
                                  ],
                                ),
                             Text("${items[index].balance} ${items[index].currencyName}",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.black25)),   
                          ],
                        ),
                                ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: ScreenSize.w14),
                    child: Divider(
                      height: 1,
                      color: AppTheme.colors.grey,
                    ),
                  )              
                ],
              ),
            ),))
      ],
     ), 
    );
  }
}