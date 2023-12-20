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
import 'package:sahopay/presentation/components/wallet_widget.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_write_widget.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ExchangeCubit(),
     child:  BlocListener<ExchangeCubit,ExchangeState>(listener: (_, state) {
       
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
                      WalletWidget(items: cubit.items, 
                      selectedItem: cubit.selectedSenderItem, 
                      press: cubit.selectedSender, 
                      title: tr('exchange.sender'), 
                      hint: tr('exchange.sender')),
                      Gap(ScreenSize.h10),
                      SvgPicture.asset(AppIcons.transfer,color: AppTheme.colors.primary,height: ScreenSize.h20),
                      WalletWidget(items:cubit.items, 
                      selectedItem: cubit.selectedRecieverItem, 
                      press: cubit.selectedReciever, 
                      title: tr('exchange.reciever'), 
                      hint: tr('exchange.reciever')),
                      Gap(ScreenSize.h12),
                      Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
        Text( tr('universal.amount'),style: AppTheme.data.textTheme.bodyMedium),
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
           controller: cubit.amountController,
           onChanged: (value)=>cubit.setCalculator(value),
           decoration:  InputDecoration(
            hintText: tr('universal.enteramount'),
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
                      icon: AppIcons.message),
                      ],
                     ),
                   ),
                   Gap(ScreenSize.h32),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Money exchange to Sahopay Wallet",style: AppTheme.data.textTheme.headlineMedium),
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
                   )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: cubit.loading,
              child: const Loading())
          ],
        ),
       ));
     }),
     ),
    );
  }
}