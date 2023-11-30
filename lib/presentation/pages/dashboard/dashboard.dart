import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/dashboard/dashboard_cubit.dart';
import 'package:sahopay/application/dashboard/dashboard_state.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DashboardCubit(),
     child:  BlocListener<DashboardCubit,DashboardState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<DashboardCubit>();
       return BlocBuilder<DashboardCubit,DashboardState>(builder: (_, state) => Scaffold());
     },),
     ),
    );
  }
}