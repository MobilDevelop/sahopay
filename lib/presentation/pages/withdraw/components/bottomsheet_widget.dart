import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/withdraw/payment.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class WithdrawBottomsheet extends StatelessWidget {
  const WithdrawBottomsheet({
    super.key, required this.items, required this.onTap,
  });
  final List<WithdrawPayment> items;
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
            itemBuilder: (context, index) => Column(
              children: [
                InkWell(
                  onTap: () => onTap(items[index]),
                  child: Container(
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
                              Text(items[index].systemName,style: AppTheme.data.textTheme.titleSmall)
                            ],
                          ),
                       Text("${Helper.toProcessCost(items[index].commission.toString())} %",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.black25)),   
                    ],
                  ),
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
            )))
        ],
      ),
    );
  }
}
