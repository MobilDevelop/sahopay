import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/exchange/exchange_cubit.dart';
import 'package:sahopay/application/exchange/exchange_state.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

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
       ));
     }),
     ),
    );
  }
}