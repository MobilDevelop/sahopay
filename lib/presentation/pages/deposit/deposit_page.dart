import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/deposit/deposit_cubit.dart';
import 'package:sahopay/application/deposit/deposit_state.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/button/main_button.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_item_payment.dart';
import 'components/deposit_items_widget.dart';
import 'components/deposit_write_widget.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DepositCubit(),
     child:  BlocListener<DepositCubit,DepositState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<DepositCubit>();
       return BlocBuilder<DepositCubit,DepositState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
          title: Text(tr('deposit.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: ScreenSize.w10,right: ScreenSize.w10,top: ScreenSize.h8),
              width: double.maxFinite,
              height: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h12),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [ 
                          Column(children: [
                          DepositItemWidget(items: cubit.walletItems,
                          selectedItem: cubit.selectedWalletItem,
                          hint: tr('universal.chooseyourwallet'), 
                          title: tr('universal.yourwallet'),
                          press:cubit.onChangedWallet),
                          Gap(ScreenSize.h14),
                          DepositItemPayment(items: cubit.paymentItems,
                          selectedItem: cubit.selectedPaymentItem,
                          hint: tr('universal.chooseyourwallet'), 
                          title: tr('universal.payment'),
                          press:cubit.onChangedPayment),
                          Gap(ScreenSize.h14),
                           DepositWriteWidget(title: tr('universal.amount'), 
                           controller: cubit.amountController, 
                           hint: tr('universal.enteramount'), 
                           icon: AppIcons.dollar1),
                          ]),
                         ],
                       ),
                     ),
                     cubit.selectedPaymentItem==null? Gap(100.h):Gap(ScreenSize.h32),
                       cubit.selectedPaymentItem==null?Text("Select Payment System \n to see Requirement",style: AppTheme.data.textTheme.displaySmall): Column(
                      children: [
                        for(int i=0;i<cubit.selectedPaymentItem!.params.length;i++)
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.only(left: ScreenSize.h16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cubit.selectedPaymentItem!.params[i].name,style: AppTheme.data.textTheme.headlineMedium),
                              Gap(ScreenSize.h6),
                              Text("${Helper.toProcessCost(cubit.selectedPaymentItem!.params[i].maxSum.toString())}  USDT"),
                            ],
                          ),
                        ),
                      ],
                     ),
                    cubit.selectedPaymentItem==null? Gap(100.h):Gap(ScreenSize.h32),
                      Padding(
                        padding: EdgeInsets.only(bottom: ScreenSize.h20),
                        child: MainButton(text:tr('deposit.add'), onPressed:cubit.sendDeposit,leftIcon: AppIcons.money),
                      )
                  ],
                ),
              ),
            ),
            Visibility(
              visible:  cubit.loading,
              child: const Loading())
          ],
        ),
       ));
     },),
     ),
    );
  }
}