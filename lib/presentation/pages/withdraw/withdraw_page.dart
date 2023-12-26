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
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/button/main_button.dart';
import 'package:sahopay/presentation/components/wallet_widget.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_write_widget.dart';
import 'package:sahopay/presentation/pages/withdraw/components/dialog_widget.dart';
import 'package:sahopay/presentation/pages/withdraw/components/payment_widget.dart';

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
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
            ),
            Gap(ScreenSize.h12),
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(tr('universal.amount'),style: AppTheme.data.textTheme.bodyMedium),
            Gap(ScreenSize.h4),
            SizedBox(
            child: TextField(
            controller: cubit.amountController,
            keyboardType: TextInputType.number,
            onChanged: (value)=>cubit.calculate(),
            textAlign: TextAlign.start,
            decoration:  InputDecoration(
            enabled: cubit.totalEnebled,
            hintText: tr('universal.enteramount'),
            contentPadding:  EdgeInsets.only(left: ScreenSize.w10,top: 23.h),
            suffixIcon: IconButton(onPressed: cubit.pressMagnet, icon: SvgPicture.asset(AppIcons.magnet,color: AppTheme.colors.red,height: ScreenSize.h16)),
            enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                           color: (cubit.amountBorder || cubit.maxMoney)? AppTheme.colors.red:AppTheme.colors.primary,
                          width: (cubit.amountBorder || cubit.maxMoney)?2:1
                          )
                          ),
                          disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: (cubit.amountBorder || cubit.maxMoney)? AppTheme.colors.red:AppTheme.colors.primary,
                            width: (cubit.amountBorder || cubit.maxMoney)?2:1
                          )
                          ),             
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: (cubit.amountBorder || cubit.maxMoney)? AppTheme.colors.red:AppTheme.colors.primary,
                            width: (cubit.amountBorder || cubit.maxMoney)?2:1
                          )
                          ),
           ),
         ),
        ),
        Gap(ScreenSize.h4),
        Visibility(
          visible:(cubit.amountBorder || cubit.maxMoney),
          child: cubit.maxMoney?Text(tr('withdraw.error1'),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red)) 
          :Text(tr('withdraw.error'),style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red))),
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
        Container(
          height: 40.h,
          //width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal:ScreenSize.w6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.colors.white,
            border: Border.all(
              color: AppTheme.colors.primary,
            ),
            borderRadius: BorderRadius.circular(10.r)
          ),
         child: TextField(
           controller: cubit.totalSumController,
           keyboardType: TextInputType.number,
           decoration:  InputDecoration(
             enabled: false,
            hintText: tr('transfer.amount'),
            contentPadding: const EdgeInsets.all(0),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
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