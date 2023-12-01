import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/drawer/drawer_cubit.dart';
import 'package:sahopay/application/drawer/drawer_state.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DrawerCubit(),
    child: BlocListener<DrawerCubit,DrawerState>(listener: (_, state) {
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<DrawerCubit>();
      return BlocBuilder<DrawerCubit,DrawerState>(builder: (_, state) => Drawer());
    },),
    ),
    );
  }
}