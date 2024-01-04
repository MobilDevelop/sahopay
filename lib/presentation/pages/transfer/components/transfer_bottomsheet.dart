import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class BottomsheetWidgetTransfer extends StatelessWidget {
  const BottomsheetWidgetTransfer({
    super.key, required this.items, required this.onTap,
  });
  final List<WalletObject> items;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      padding: EdgeInsets.only(top: ScreenSize.h10),
      decoration: BoxDecoration(
        color: AppTheme.colors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              onTap: (){
                Navigator.pop(context);
                onTap(items[index]);
              },
              child: Column(
                children: [
                  Container(
                  height: 45.h,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: ScreenSize.w14,right: ScreenSize.h8),
                  margin: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h4 ),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.white, 
                   ),
                  child: Row(
                    children: [
                      Container(
                  height: 33.h,
                  width: 33.h,
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.h4),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.colors.grey.withOpacity(.6),
                      width: 1.5
                    ),
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  child:Image.network(AppContatants.imageUrl+items[index].logoUrl,errorBuilder: (context, error, stackTrace) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.cardSvg),
                  ) ),
                    ),
                    Gap(ScreenSize.w14),
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items[index].account,style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),
                    Text("${items[index].balance} ${items[index].currencyName}",
                   style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.stroke)), 
                  ],
                    )
                    ],
                  )
                      ),
                      Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.w18),
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
