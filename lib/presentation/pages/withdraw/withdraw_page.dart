import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/withdraw/withdraw_cubit.dart';
import 'package:sahopay/application/withdraw/withdraw_state.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/infrastructure/models/withdraw/payment.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/button/main_button.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_write_widget.dart';
import 'package:sahopay/presentation/pages/withdraw/components/dialog_widget.dart';
import 'components/address_widget.dart';
import 'components/amount_widget.dart';
import 'components/bottomsheet_widget.dart';
import 'components/payment_widget_.dart';
import 'components/total_sum_widget.dart';
import 'components/wallet_bottom_sheet.dart';
import 'components/wallet_widget.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key, this.model});
  final DashboardModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => WithdrawCubit(model),
    child: BlocListener<WithdrawCubit,WithDrawState>(listener: (context, state) {
      if(state is WithDrawMessage){
        Navigator.pop(context);
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
       }else  if(state is WithDrawDialog){
                  AwesomeDialog(
                  context: context,
                  dialogType:DialogType.success,
                  animType: AnimType.bottomSlide,
                  body: DialogWidgetWithdraw(item: state.response),
                  btnOkText: "OK",
                  btnOkColor: AppTheme.colors.primary,
                  btnOkOnPress:(){
                    Navigator.pop(context);
                  },
                  ).show();
       }
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h16),
                   margin: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
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

                    PaymentWidgetWithdraw(payment:cubit.selectedPaymentItem, press: () { 
                      showModalBottomSheet(context: context, 
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) => WithdrawBottomsheet(items: cubit.itemsPayment, onTap:(WithdrawPayment payment){
                        Navigator.pop(context);
                        cubit.selectedPayment(payment);
                      }));
                     },),

                   WithdrawWalletWidget(wallet: cubit.selectedWalletItem, press: () { 
                    showModalBottomSheet(context: context, 
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) => WalletBottomSheet(items:cubit.itemsWallet, onTap:(WalletObject wallet){
                      Navigator.pop(context);
                      cubit.selectedWallet(wallet);
                    }));
                    }),
                    
                   AddressWidgetWithdraw(cubit: cubit),

                   AmountWidgetWithdraw(cubit: cubit),

                    Gap(ScreenSize.h6),
                    Row(
                        children: [
                          Checkbox(value: cubit.checked, onChanged: cubit.showChecked,activeColor: AppTheme.colors.primary),
                          Text(tr('universal.comission'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),
                        ],
                      ), 
                    Gap(ScreenSize.h4),
                    TotalSummWidgetWithdraw(cubit: cubit),
                   
                   
                    DepositWriteWidget(title: tr('universal.comment'), 
                    controller: cubit.commentController, 
                    hint: tr('universal.entercomment'), 
                    icon: AppIcons.message, errorBoder: false, hint2: '', enebled: true,),
                    ]
                   ),
                 ),
                 Gap(ScreenSize.h32),
                    cubit.selectedPaymentItem!=null?Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w12),
                      child: Text("Wthdraw with ${cubit.selectedPaymentItem!.systemName}",
                      style: AppTheme.data.textTheme.displaySmall,
                      ),
                    ),  
                    Gap(ScreenSize.h10),  
                    for(int i=0;i<cubit.selectedPaymentItem!.params.length;i++)
                    Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(left: ScreenSize.h16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cubit.selectedPaymentItem!.params[i].name.toString(),style: AppTheme.data.textTheme.titleSmall),
                        Gap(ScreenSize.h4),
                        Text("\$ ${Helper.toProcessCost(cubit.selectedPaymentItem!.params[i].maxSum.toString())}"),
                        Gap(ScreenSize.h8),
                      ],
                    ),
                    ),],
                    ):Text("Select Payment System to see Requirement",
                    style: AppTheme.data.textTheme.displaySmall,
                    textAlign: TextAlign.center,
                    ),
                     Gap(ScreenSize.h32),
                 Padding(
                   padding: EdgeInsets.only(bottom: ScreenSize.h32,right: ScreenSize.w10,left: ScreenSize.w10),
                   child: MainButton(text: tr('withdraw.title'), 
                   onPressed:cubit.sendInfo,
                   leftIcon: AppIcons.withdraw),
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