import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/application/transfer/transfer_cubit.dart';
import 'package:sahopay/application/transfer/transfer_state.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/wallet_widget.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_write_widget.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:sahopay/presentation/pages/transfer/components/payment_item_widget.dart';

import 'components/dialog_widget.dart';

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
                  btnOkText: "OK",
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
            
                    WalletWidget(
                    items: cubit.itemsWallet, 
                    selectedItem: cubit.selectedWalletItem, 
                    press: cubit.selectedWallet, 
                    title: tr('universal.yourwallet'), 
                    hint: tr('universal.chooseyourwallet'),
                    ),

                    Visibility(
                      visible: cubit.selectedWalletItem!=null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(ScreenSize.h12),
                          Text( tr('transfer.number'),style: AppTheme.data.textTheme.bodyMedium),
                          Gap(ScreenSize.h4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 40.h,
                                width: 40.h,
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
                                child: Container(
                                height: 40.h,
                                padding: EdgeInsets.symmetric(horizontal:ScreenSize.w6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                color: AppTheme.colors.white,
                                                  border: Border.all(
                                                 color: cubit.numberBorder? AppTheme.colors.red:AppTheme.colors.primary,
                                                 width: cubit.numberBorder?2:1
                                                  ),
                                                  borderRadius: BorderRadius.circular(10.r)
                                                  ),
                                                  child: TextField(
                                                  controller: cubit.numberController,
                                                 // onChanged: cubit.onChanged,
                                                  inputFormatters: [
                                                   cubit.maskFormatter
                                                  ],
                                                  decoration:  const InputDecoration(
                                                  contentPadding: EdgeInsets.all(0),
                                                  enabledBorder: InputBorder.none,
                                                  focusedBorder: InputBorder.none,
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
                      ),
                    ),

                    Gap(ScreenSize.h10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr('universal.amount'),style: AppTheme.data.textTheme.bodyMedium),
                        Container(
                          height: 45.h,
                          //width: double.maxFinite,
                          alignment: Alignment.center,
                          child: TextField(
                          controller: cubit.amountController,
                          onChanged: (value)=>cubit.onSubmitted(value),
                          decoration:  InputDecoration(
                          hintText: tr('universal.enteramount'),
                          suffixIcon: IconButton(onPressed: cubit.pressMagnet, icon: SvgPicture.asset(AppIcons.magnet,color: AppTheme.colors.red,height: ScreenSize.h16)),
                          contentPadding:  EdgeInsets.symmetric(horizontal: ScreenSize.w12),
                          enabledBorder: OutlineInputBorder(
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
                            visible: (cubit.amountBorder && cubit.amountController.text.trim().isEmpty),
                            child: Text( tr('transfer.error2'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.red))),  
                      ],
                    ),
                    Gap(ScreenSize.h6),
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
                    contentPadding:  EdgeInsets.symmetric(horizontal: ScreenSize.w10),
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
                    icon: AppIcons.message, errorBoder: false, hint2: '',),
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
                        child: Text("Transfer with",style: AppTheme.data.textTheme.headlineMedium)),
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

