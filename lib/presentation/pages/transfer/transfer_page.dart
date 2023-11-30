import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/transfer/transfer_cubit.dart';
import 'package:sahopay/application/transfer/transfer_state.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => TransferCubit(),
     child:  BlocListener<TransferCubit,TransferState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<TransferCubit>();
       return BlocBuilder<TransferCubit,TransferState>(builder: (_, state) => Scaffold());
     },),
     ),
    );
  }
}