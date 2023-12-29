

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/application/transfer/transfer_cubit.dart';
import 'package:sahopay/application/transfer/transfer_state.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_write_widget.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:sahopay/presentation/pages/transfer/components/select_wallet_widget.dart';

import 'components/account_number_widget.dart';
import 'components/dialog_widget.dart';
import 'components/enter_amount_widget.dart';
import 'components/payment_widget.dart';
import 'components/transfer_bottomsheet.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key, this.model});
  final DashboardModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TransferCubit(model),
     child:  BlocListener<TransferCubit,TransferState>(listener: (_, state) {
       if(state is TransferDialog){
      AwesomeDialog(
            context: context,
            dialogType:DialogType.success,
            animType: AnimType.bottomSlide,
            body: DialogWidget(item: state.response),
            btnOkText: tr("drawer.yes"),
            btnOkColor: AppTheme.colors.primary,
            btnOkOnPress:(){
            Navigator.pop(context);
          },
        ).show();
       }
     },
     child: Builder(builder: (context) {
       final cubit = context.read<TransferCubit>();
       return BlocBuilder<TransferCubit,TransferState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: SvgPicture.asset(AppIcons.back,color: AppTheme.colors.white)),
          elevation: 0,
          title: Text(tr('transfer.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
          centerTitle: true,
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
                      borderRadius: BorderRadius.circular(7.r)
                    ),
                   child: Column(
                    children: [
                    
                    PaymentWidgetTransfer(payment: cubit.selectedPaymentItem),
            
                    Gap(ScreenSize.h12),

                    SelectWalletWidget(selectedWalletItem: cubit.selectedWalletItem, press: () { 
                      showModalBottomSheet(context: context, 
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) => BottomsheetWidgetTransfer(items: cubit.itemsWallet, onTap:(WalletObject wallet)=>cubit.selectedWallet(wallet)));
                     },),

                    Visibility(
                      visible: cubit.selectedWalletItem!=null,
                      child: AccountNumberWidget(cubit: cubit),
                    ),

                    EnterAmountWidget(cubit: cubit),
                   
                    Row(
                        children: [
                          Checkbox(value: cubit.checked, onChanged: cubit.showChecked,activeColor: AppTheme.colors.primary),
                          Text(tr('universal.comission'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),
                        ],
                      ),
                    Gap(ScreenSize.h4),
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(tr('universal.totalsum'),style: AppTheme.data.textTheme.bodyMedium),
                    Gap(ScreenSize.h4),
                    TextField(
                    controller: cubit.totalSumController,
                    decoration:  InputDecoration(
                    hintText: tr('transfer.amount'),
                    enabled: false,
                    contentPadding:  EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
                    disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                    color: AppTheme.colors.primary,
                          ),
                        ),
                       ),
                      ),
                     ],
                    ),
                    Gap(ScreenSize.h12),
                    DepositWriteWidget(title: tr('universal.comment'), 
                    controller: cubit.commentController, 
                    hint: tr('universal.entercomment'), 
                    icon: AppIcons.message, errorBoder: false, hint2: '', enebled: true,),
                    ],
                   ),
                 ),
                  cubit.selectedPaymentItem==null? Gap(60.h):Gap(ScreenSize.h12),
                     cubit.selectedPaymentItem==null?Text("Select Payment System \n to see Requirement",style: AppTheme.data.textTheme.displaySmall): Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: ScreenSize.w20),
                        child: Text(tr("transfer.with"),style: AppTheme.data.textTheme.headlineMedium)),
                        Gap(ScreenSize.h14),
                      for(int i=0;i<cubit.selectedPaymentItem!.params.length;i++)
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(left: ScreenSize.h16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cubit.selectedPaymentItem!.params[i].name,style: AppTheme.data.textTheme.titleSmall),
                            Gap(ScreenSize.h6),
                            Text("\$  ${Helper.toProcessCost(cubit.selectedPaymentItem!.params[i].maxSum.toString())}"),
                          ],
                        ),
                      ),
                    ],
                   ),
                  cubit.selectedPaymentItem==null? Gap(60.h):Gap(ScreenSize.h32),
                  Padding(
                   padding: EdgeInsets.only(bottom: ScreenSize.h32,left: ScreenSize.h10,right: ScreenSize.h10),
                   child: MainButton(text: tr('transfer.title'), 
                   onPressed:cubit.sendTransfer,
                   leftIcon: AppIcons.send),
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
     },),
     ),
    );
  }
}



