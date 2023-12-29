
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/application/transfer/transfer_cubit.dart';

import '../../login/library/login_library.dart';

class EnterAmountWidget extends StatelessWidget {
  const EnterAmountWidget({
    super.key,
    required this.cubit,
  });

  final TransferCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(ScreenSize.h10),
        Text(tr('universal.amount'),style: AppTheme.data.textTheme.bodyMedium),
        Container(
          height: 45.h,
          //width: double.maxFinite,
          alignment: Alignment.center,
          child: TextField(
          controller: cubit.amountController,
          keyboardType: TextInputType.number,
          onChanged: (value)=>cubit.onSubmitted(value),
          decoration:  InputDecoration(
          enabled: cubit.enebled,
          hintText: tr('universal.enteramount'),
          suffixIcon: IconButton(onPressed: cubit.pressMagnet, icon: SvgPicture.asset(AppIcons.magnet,color: AppTheme.colors.red,height: ScreenSize.h16)),
          contentPadding:  EdgeInsets.symmetric(horizontal: ScreenSize.w12,vertical: ScreenSize.h10),
          enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: cubit.amountBorder? AppTheme.colors.red:AppTheme.colors.primary,
            width: cubit.amountBorder?2:1
          )
          ),
          disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: cubit.amountBorder? AppTheme.colors.red:AppTheme.colors.primary,
            width: cubit.amountBorder?2:1
          )
          ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: cubit.amountBorder? AppTheme.colors.red:AppTheme.colors.primary,
            width: cubit.amountBorder?2:1
          )
          ),
              ),
            ), 
          ),
        Gap(ScreenSize.h4),
           Visibility(
            visible: (cubit.amountBorder),
            child: Text(cubit.amountController.text.trim().isEmpty?tr('transfer.error2'):tr("withdraw.error1"),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.red))), 
             Gap(ScreenSize.h6), 
      ],
    );
  }
}