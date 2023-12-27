import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/application/withdraw/withdraw_cubit.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class AmountWidgetWithdraw extends StatelessWidget {
  const AmountWidgetWithdraw({
    super.key,
    required this.cubit,
  });

  final WithdrawCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Gap(ScreenSize.h12),
    Text(tr('universal.amount'),style: AppTheme.data.textTheme.bodyMedium),
    Gap(ScreenSize.h4),
    SizedBox(
    child: TextField(
    controller: cubit.amountController,
    keyboardType: TextInputType.number,
    onChanged: (value)=>cubit.calculate(),
    textAlign: TextAlign.start,
    decoration:  InputDecoration(
    enabled: cubit.totalEnebled,
    hintText: tr('universal.enteramount'),
    contentPadding:  EdgeInsets.only(left: ScreenSize.w10,top: 23.h),
    suffixIcon: IconButton(onPressed: cubit.pressMagnet, icon: SvgPicture.asset(AppIcons.magnet,color: AppTheme.colors.red,height: ScreenSize.h16)),
    enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                   color: (cubit.amountBorder || cubit.maxMoney)? AppTheme.colors.red:AppTheme.colors.primary,
                  width: (cubit.amountBorder || cubit.maxMoney)?2:1
                  )
                  ),
                  disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: (cubit.amountBorder || cubit.maxMoney)? AppTheme.colors.red:AppTheme.colors.primary,
                    width: (cubit.amountBorder || cubit.maxMoney)?2:1
                  )
                  ),             
                  focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: (cubit.amountBorder || cubit.maxMoney)? AppTheme.colors.red:AppTheme.colors.primary,
                    width: (cubit.amountBorder || cubit.maxMoney)?2:1
                  )
                  ),
           ),
         ),
        ),
        Gap(ScreenSize.h4),
        Visibility(
          visible:(cubit.amountBorder || cubit.maxMoney),
          child: cubit.maxMoney?Text(tr('withdraw.error1'),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red)) 
          :Text(tr('withdraw.error'),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red))),
      ],
    );
  }
}