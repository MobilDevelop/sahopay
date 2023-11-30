import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/deposit/deposit_cubit.dart';
import 'package:sahopay/application/deposit/deposit_state.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DepositCubit(),
     child:  BlocListener<DepositCubit,DepositState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<DepositCubit>();
       return BlocBuilder<DepositCubit,DepositState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
          title: Text(tr('deposit.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
       ));
     },),
     ),
    );
  }
}