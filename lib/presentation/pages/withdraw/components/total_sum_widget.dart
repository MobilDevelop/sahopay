import 'package:flutter/material.dart';
import 'package:sahopay/application/withdraw/withdraw_cubit.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class TotalSummWidgetWithdraw extends StatelessWidget {
  const TotalSummWidgetWithdraw({
    super.key,
    required this.cubit,
  });

  final WithdrawCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr('universal.totalsum'),style: AppTheme.data.textTheme.bodyMedium),
        Gap(ScreenSize.h4),
        Container(
          height: 40.h,
          //width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal:ScreenSize.w6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.primary,
            ),
            borderRadius: BorderRadius.circular(10.r)
          ),
         child: TextField(
           controller: cubit.totalSumController,
           keyboardType: TextInputType.number,
           decoration:  InputDecoration(
             enabled: false,
            hintText: tr('transfer.amount'),
            contentPadding: const EdgeInsets.all(0),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
           ),
         ), 
        ),
         Gap(ScreenSize.h12),
      ],
    );
  }
}