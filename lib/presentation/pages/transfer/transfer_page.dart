import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/application/transfer/transfer_cubit.dart';
import 'package:sahopay/application/transfer/transfer_state.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_items_widget.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_write_widget.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:sahopay/presentation/pages/transfer/components/payment_item_widget.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TransferCubit(),
     child:  BlocListener<TransferCubit,TransferState>(listener: (_, state) {
       
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
                    TransferPaymentWidget(
                    items: cubit.itemsPayment, 
                    selectedItem: cubit.selectedPaymentItem, 
                    press:cubit.selectedPayment, 
                    title: tr('universal.payment'), 
                    hint: tr('universal.chooseyourwallet')),
                    Gap(ScreenSize.h12),
            
                    DepositItemWidget(
                    items: cubit.itemsWallet, 
                    selectedItem: cubit.selectedWalletItem, 
                    press: cubit.selectedWallet, 
                    title: tr('universal.yourwallet'), 
                    hint: tr('universal.chooseyourwallet')),
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
                  cubit.selectedPaymentItem==null? Gap(60.h):Gap(ScreenSize.h32),
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
                  cubit.selectedPaymentItem==null? Gap(60.h):Gap(ScreenSize.h32),
                 Padding(
                   padding: EdgeInsets.only(bottom: ScreenSize.h32,left: ScreenSize.h10,right: ScreenSize.h10),
                   child: MainButton(text: tr('transfer.title'), onPressed:(){},leftIcon: AppIcons.send),
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