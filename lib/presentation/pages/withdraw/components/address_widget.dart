import 'package:flutter/material.dart';
import 'package:sahopay/application/withdraw/withdraw_cubit.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class AddressWidgetWithdraw extends StatelessWidget {
  const AddressWidgetWithdraw({
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
      Text(tr('withdraw.adress'),style: AppTheme.data.textTheme.bodyMedium),
      Gap(ScreenSize.h4),
      SizedBox(
      child: TextField(
      controller: cubit.addressSumController,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value)=>cubit.calculate(),
      textAlign: TextAlign.start,
      decoration:  InputDecoration(
      hintText: tr('withdraw.enteradress'),
      contentPadding:  EdgeInsets.only(left: ScreenSize.w10,top: 23.h),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
             color: cubit.emailBorder? AppTheme.colors.red:AppTheme.colors.primary,
            width: cubit.emailBorder?2:1
          )
          ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: cubit.emailBorder? AppTheme.colors.red:AppTheme.colors.primary,
            width: cubit.emailBorder?2:1
          )
          ),
              ),
             ),
             ),
             Gap(ScreenSize.h4),
             Visibility(
             visible: cubit.emailBorder,
             child: Text(tr('withdraw.error2'),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red))),
            ],
    );
  }
}