import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/login/login_cubit.dart';
import 'package:sahopay/application/login/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(),
    child:  BlocListener<LoginCubit,LoginState>(listener: (context, state) {
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<LoginCubit>();
      return BlocBuilder<LoginCubit,LoginState>(builder: (context, state) => Scaffold());
    },),
    ),
    );
  }
}