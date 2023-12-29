import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/deposit/deposit_cubit.dart';
import 'package:sahopay/application/deposit/deposit_state.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/infrastructure/models/deposit/deposit.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/button/main_button.dart';
import 'package:sahopay/presentation/pages/deposit/components/amount_widget.dart';
import 'package:sahopay/presentation/pages/deposit/components/payment_widget.dart';
import 'package:sahopay/presentation/pages/deposit/components/paymet_bottom_sheet.dart';
import 'package:sahopay/presentation/pages/withdraw/components/wallet_widget.dart';
import '../withdraw/components/wallet_bottom_sheet.dart';
class DepositPage extends StatelessWidget {
  const DepositPage({super.key, this.model});
  final DashboardModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DepositCubit(model),
     child:  BlocListener<DepositCubit,DepositState>(listener: (_, state) {
       if(state is DepositMessage){
         ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppTheme.colors.primary,
              content: Text(
                state.message,
                textAlign: TextAlign.center,
                style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.white)
              ),
            ),
          );
       }
     },
     child: Builder(builder: (context) {
       final cubit = context.read<DepositCubit>();
       return BlocBuilder<DepositCubit,DepositState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
          title: Text(tr('deposit.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: cubit.listRefresh,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h12),
                      margin: EdgeInsets.only(left: ScreenSize.w10,right: ScreenSize.w10,top: ScreenSize.h8),
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
            
                    WithdrawWalletWidget(wallet: cubit.selectedWalletItem, press: () { 
                    showModalBottomSheet(context: context, 
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) => WalletBottomSheet(items:cubit.walletItems, onTap:(WalletObject wallet){
                      Navigator.pop(context);
                      cubit.onChangedWallet(wallet);
                    }));
                    }),
                          Gap(ScreenSize.h14),
                          
                          
                          PaymentWidgetDeposit(payment: cubit.selectedPaymentItem, press: () {
                             showModalBottomSheet(context: context, 
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) => DepositBottomsheet(items: cubit.paymentItems, onTap:(DepositPayment payment){
                        Navigator.pop(context);
                        cubit.onChangedPayment(payment);
                      }));
                          },),
                          
                          Gap(ScreenSize.h14),
            
                           DepositAmountWidget(title: tr('universal.amount'), 
                           controller: cubit.amountController, 
                           hint: tr('universal.enteramount'), 
                           errorBoder: cubit.errorBorder,
                           hint2: tr('deposit.error'), 
                           enebled: cubit.enebled, onChanged:cubit.onChanged, 
                           ),
                          ]),
                         ],
                       ),
                     ),
                     cubit.selectedPaymentItem==null? Gap(100.h):Gap(ScreenSize.h32),
                     cubit.selectedPaymentItem==null?Text( tr('deposit.select'),
                     style: AppTheme.data.textTheme.displaySmall): Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("   Withdraw with ${cubit.selectedPaymentItem!.systemName}",style: AppTheme.data.textTheme.headlineMedium),
                        Gap(ScreenSize.h10),
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
                        padding: EdgeInsets.only(bottom: ScreenSize.h20,left: ScreenSize.w10,right: ScreenSize.w10),
                        child: MainButton(text:tr('deposit.add'), onPressed:cubit.sendDeposit,leftIcon: AppIcons.money),
                      ),
                      Gap(60.h)
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