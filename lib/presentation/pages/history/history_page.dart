import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/history/history_cubit.dart';
import 'package:sahopay/application/history/history_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HistoryCubit(),
     child:  BlocListener<HistoryCubit,HistoryState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<HistoryCubit>();
       return BlocBuilder<HistoryCubit,HistoryState>(builder: (_, state) => Scaffold());
     },),
     ),
    );
  }
}