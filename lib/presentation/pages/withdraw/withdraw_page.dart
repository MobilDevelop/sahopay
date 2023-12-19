import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/withdraw/withdraw_cubit.dart';
import 'package:sahopay/application/withdraw/withdraw_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/button/main_button.dart';
import 'package:sahopay/presentation/components/wallet_widget.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_write_widget.dart';
import 'package:sahopay/presentation/pages/withdraw/components/payment_widget.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => WithdrawCubit(),
    child: BlocListener<WithdrawCubit,WithDrawState>(listener: (context, state) {
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<WithdrawCubit>();
      return BlocBuilder<WithdrawCubit,WithDrawState>(builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
           leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: SvgPicture.asset(AppIcons.back,color: AppTheme.colors.white)),
          title: Text(tr('withdraw.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h16),
                    decoration: BoxDecoration(
                      color: AppTheme.colors.white ,
                      border: Border.all(
                        color: AppTheme.colors.primary,
                        width: .5
                      ),
                      boxShadow: [
                   BoxShadow(
                   color: AppTheme.colors.grey.withOpacity(.6),
                   blurRadius: 15,
                   spreadRadius: 10,
                   offset: Offset(5.w, 10.h)
                     )
                   ],
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                   child: Column(
                    children: [
                    WithdrawPaymentWidget(
                    items: cubit.itemsPayment,
                    selectedItem: cubit.selectedPaymentItem,
                    press: cubit.selectedPayment, 
                    title: tr('universal.payment'), 
                    hint: tr('universal.chooseyourwallet')),
                    Gap(ScreenSize.h12),

                    WalletWidget(
                    items: cubit.itemsWallet, 
                    selectedItem: cubit.selectedWalletItem, 
                    press: cubit.selectedWallet, 
                    title: tr('universal.yourwallet'), 
                    hint: tr('universal.chooseyourwallet')),
                    Gap(ScreenSize.h12),
                    DepositWriteWidget(title: tr('withdraw.adress'), 
                    controller: cubit.addressSumController, 
                    hint: tr('withdraw.enteradress'), 
                    icon: ""),
                    Gap(ScreenSize.h12),
                    DepositWriteWidget(title: tr('universal.amount'), 
                    controller: cubit.amountController, 
                    hint: tr('universal.enteramount'), 
                    icon: AppIcons.dollar1),
                    Gap(ScreenSize.h6),
                    Row(
                        children: [
                          Checkbox(value: cubit.checked, onChanged: cubit.showChecked,activeColor: AppTheme.colors.primary),
                          Text(tr('universal.comission'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),
                        ],
                      ), 
                    Gap(ScreenSize.h4),  
                    DepositWriteWidget(title: tr('universal.totalsum'), 
                    controller: cubit.totalSumController, 
                    hint: tr('transfer.amount'), 
                    icon: AppIcons.dollar1),
                    Gap(ScreenSize.h12),
                    DepositWriteWidget(title: tr('universal.comment'), 
                    controller: cubit.commentController, 
                    hint: tr('universal.entercomment'), 
                    icon: AppIcons.message),
                    ],
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(bottom: ScreenSize.h10),
                   child: MainButton(text: tr('withdraw.title'), onPressed:(){},leftIcon: AppIcons.withdraw),
                 )
                ],
              ),
            ),
            Visibility(
              visible: cubit.loading,
              child: const Loading())
          ],
        ),
      ));
    },),),
    );
  }
}