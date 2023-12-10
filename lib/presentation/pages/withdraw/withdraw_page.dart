import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/application/withdraw/withdraw_cubit.dart';
import 'package:sahopay/application/withdraw/withdraw_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => WithdrawCubit(),
    child: BlocListener<WithdrawCubit,WithDrawState>(listener: (context, state) {
      
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
      ));
    },),),
    );
  }
}