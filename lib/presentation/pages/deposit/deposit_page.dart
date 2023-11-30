import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/deposit/deposit_cubit.dart';
import 'package:sahopay/application/deposit/deposit_state.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DepositCubit(),
     child:  BlocListener<DepositCubit,DepositState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<DepositCubit>();
       return BlocBuilder<DepositCubit,DepositState>(builder: (_, state) => Scaffold());
     },),
     ),
    );
  }
}