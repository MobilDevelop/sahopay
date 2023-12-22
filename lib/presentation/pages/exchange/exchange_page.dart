import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/exchange/exchange_cubit.dart';
import 'package:sahopay/application/exchange/exchange_state.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/button/main_button.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_write_widget.dart';
import 'package:sahopay/presentation/pages/exchange/components/item_widget.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ExchangeCubit(),
     child:  BlocListener<ExchangeCubit,ExchangeState>(listener: (_, state) {
       if(state is ExchangeMessage){
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
       final cubit = context.read<ExchangeCubit>();
       return BlocBuilder<ExchangeCubit,ExchangeState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
          title: Text(tr('exchange.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
              child: SingleChildScrollView(
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
                      ExchangeItemWidget(items: cubit.items, 
                      selectedItem: cubit.selectedSenderItem, 
                      press: cubit.selectedSender, 
                      title: tr('exchange.sender'), 
                      hint: tr('exchange.sender'), 
                      borderColor: cubit.senderBorderColor, errorText:cubit.senderItemEmpty?tr('exchange.error2'):tr('exchange.error1')),
                      Gap(ScreenSize.h18),
                     // SvgPicture.asset(AppIcons.transfer,color: AppTheme.colors.primary,height: ScreenSize.h20),
                      ExchangeItemWidget(items:cubit.items, 
                      selectedItem: cubit.selectedRecieverItem, 
                      press: cubit.selectedReciever, 
                      title: tr('exchange.reciever'), 
                      hint: tr('exchange.reciever'), 
                      borderColor: cubit.recieverBorderColor, errorText:tr('exchange.error1')),
                      Gap(ScreenSize.h12),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( tr('universal.amount'),style: AppTheme.data.textTheme.bodyMedium),
                        Gap(ScreenSize.h4),
                        Container(
                          height: 45.h,
                          //width: double.maxFinite,
                          alignment: Alignment.center,
                          child: TextField(
                          controller: cubit.amountController,
                          onSubmitted: (value)=>cubit.onSubmitted(value),
                          decoration:  InputDecoration(
                          hintText: tr('universal.enteramount'),
                          suffixIcon: IconButton(onPressed: cubit.pressMagnet, icon: SvgPicture.asset(AppIcons.magnet,color: AppTheme.colors.red,height: ScreenSize.h16)),
                          contentPadding:  EdgeInsets.symmetric(horizontal: ScreenSize.w12),
                          enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: AppTheme.colors.primary
                          )
                          ),
                          focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: AppTheme.colors.primary
                          )
                          ),
                              ),
                            ), 
                          ),
                      cubit.calculatorValue==null?Container(): Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(left: ScreenSize.w10),
                        child: Text("${cubit.calculatorValue!.calAmount} ${cubit.calculatorValue!.recipientCurrensy}",
                        style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.green))),
                        ],
                      ),
                      Gap(ScreenSize.h12),
                      DepositWriteWidget(title: tr('universal.comment'), 
                      controller: cubit.commentController, 
                      hint: tr('universal.entercomment'), 
                      icon: AppIcons.message),
                      
                         ],
                        ),
                      ),
                      Gap(ScreenSize.h32),
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr('exchange.money'),style: AppTheme.data.textTheme.headlineMedium),
                        Gap(ScreenSize.h20),
                        for(int i=0;i<cubit.ratesItems.length;i++)
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("1.0  ${cubit.ratesItems[i].recipientCurrency}",style: AppTheme.data.textTheme.titleSmall),
                                  Gap(ScreenSize.w14),
                                  SvgPicture.asset(AppIcons.right),
                                  Gap(ScreenSize.w14),
                                  Text("${cubit.ratesItems[i].rate} ${cubit.ratesItems[i].senderCurrency}",style: AppTheme.data.textTheme.titleSmall),
                                ],
                              ),
                              Gap(ScreenSize.h10),
                            ],
                          ),
                        ),
                      ],
                     ),
                    Gap(ScreenSize.h32),
                   Padding(
                     padding: EdgeInsets.only(bottom: ScreenSize.h10),
                     child: MainButton(text: tr('exchange.title'), onPressed:cubit.buttonExchange,leftIcon: AppIcons.exchange),
                   ),
                   Gap(ScreenSize.h32),
                   ]
                  ),
                ),
              ),
              Visibility(
                visible: cubit.loading,
                child: const Loading()
                )],
              ),
            )
          );
        }),
      ),
    );
  }
}