import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/dashboard/dashboard_cubit.dart';
import 'package:sahopay/application/dashboard/dashboard_state.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DashboardCubit(),
     child:  BlocListener<DashboardCubit,DashboardState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<DashboardCubit>();
       return BlocBuilder<DashboardCubit,DashboardState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
          title: Text(tr('dashboard.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
       ));
     },),
     ),
    );
  }
}