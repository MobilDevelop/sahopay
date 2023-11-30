
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/setting/setting_cubit.dart';
import 'package:sahopay/application/setting/setting_state.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SettingCubit(),
     child:  BlocListener<SettingCubit,SettingState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<SettingCubit>();
       return BlocBuilder<SettingCubit,SettingState>(builder: (_, state) => Scaffold());
     },),
     ),
    );
  }
}