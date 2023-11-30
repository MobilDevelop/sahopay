import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/exchange/exchange_cubit.dart';
import 'package:sahopay/application/exchange/exchange_state.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ExchangeCubit(),
     child:  BlocListener<ExchangeCubit,ExchangeState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<ExchangeCubit>();
       return BlocBuilder<ExchangeCubit,ExchangeState>(builder: (_, state) => Scaffold());
     }),
     ),
    );
  }
}