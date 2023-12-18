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
import 'package:sahopay/presentation/components/button/main_button.dart';
import 'package:sahopay/presentation/pages/deposit/components/deposit_items_widget.dart';
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
        body: Container(
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
                  DepositItemWidget(items: [], 
                  selectedItem: null, 
                  press: (){}, 
                  title: tr('exchange.sender'), 
                  hint: tr('exchange.sender')),
                  Gap(ScreenSize.h10),
                  SvgPicture.asset(AppIcons.transfer,color: AppTheme.colors.primary,height: ScreenSize.h20),
                  DepositItemWidget(items: [], 
                  selectedItem: null, 
                  press: (){}, 
                  title: tr('exchange.reciever'), 
                  hint: tr('exchange.reciever')),
                  Gap(ScreenSize.h12),
                  DepositWriteWidget(title: tr('universal.amount'), 
                  controller: cubit.amountController, 
                  hint: tr('universal.enteramount'), 
                  icon: AppIcons.dollar1),
                  Gap(ScreenSize.h12),
                  DepositWriteWidget(title: tr('universal.comment'), 
                  controller: cubit.commentController, 
                  hint: tr('universal.entercomment'), 
                  icon: AppIcons.message),
                  ],
                 ),
               ),
               Container(
                height: 200,
               ),
               Padding(
                 padding: EdgeInsets.only(bottom: ScreenSize.h10),
                 child: MainButton(text: tr('exchange.title'), onPressed:cubit.buttonExchange,leftIcon: AppIcons.exchange),
               )
              ],
            ),
          ),
        ),
       ));
     }),
     ),
    );
  }
}