import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/registration/registration_cubit.dart';
import 'package:sahopay/application/registration/registration_state.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => RegistrationCubit(),
    child: BlocListener<RegistrationCubit,RegistrationState>(listener: (context, state) {
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<RegistrationCubit>();
      return BlocBuilder<RegistrationCubit,RegistrationState>(builder: (context, state) => Scaffold(
        
      ));
    },),
    ),
    );
  }
}