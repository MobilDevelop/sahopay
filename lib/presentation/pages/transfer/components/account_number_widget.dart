import 'package:flutter/material.dart';
import 'package:sahopay/application/transfer/transfer_cubit.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class AccountNumberWidget extends StatelessWidget {
  const AccountNumberWidget({
    super.key,
    required this.cubit,
  });

  final TransferCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(ScreenSize.h12),
        Text( tr('transfer.number'),style: AppTheme.data.textTheme.bodyMedium),
        Gap(ScreenSize.h4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 35.h,
              width: 35.h,
              margin: EdgeInsets.only(right: ScreenSize.h6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: cubit.numberBorder? AppTheme.colors.red:AppTheme.colors.primary,
                  width: cubit.numberBorder?2:1
                ),
                borderRadius: BorderRadius.circular(10.r)
              ),
              alignment: Alignment.center,
              child: cubit.selectedWalletItem==null?const Center():Text(cubit.accountNumber,style: AppTheme.data.textTheme.headlineMedium),
            ),
            Expanded(
              child: TextField(
              controller: cubit.numberController,
              inputFormatters: [
               cubit.maskFormatter
              ],
              decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: cubit.numberBorder? AppTheme.colors.red:AppTheme.colors.primary,
                  width: cubit.numberBorder?2:1
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: cubit.numberBorder? AppTheme.colors.red:AppTheme.colors.primary,
                  width: cubit.numberBorder?2:1
                )
              ),
                               ),
              ),
            ),
          ],
        ),
        Gap(ScreenSize.h4),
         Visibility(
          visible: cubit.numberBorder,
          child: Text( tr('transfer.error'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.red))),
      ],
    );
  }
}