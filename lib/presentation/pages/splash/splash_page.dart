
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sahopay/application/splash/splash_cubit.dart';
import 'package:sahopay/application/splash/splash_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/routes/entity/routes.dart';
import 'components/animation_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SplashCubit(),
     child: BlocListener<SplashCubit,SplashState>(listener: (_, state) {
       if(state is SplashNextHome){
        context.go(Routes.home.path);
       }else if(state is SplashNextLogin){
        context.go(Routes.login.path);
       }else if(state is SplashError){
         ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppTheme.colors.primary,
              content: Text(
                state.message,
                textAlign: TextAlign.center,
                style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.white)
              ),
            ),
          );
       }
     },
     child: Builder(builder: (context) {
       final cubit = context.read<SplashCubit>();
       return BlocBuilder<SplashCubit,SplashState>(builder: (_, state) => Stack(
         children: [
           Scaffold(
            backgroundColor: AppTheme.colors.background, 
            body: 
            Center(child: Text("SAHOPAY",style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary))),
           ),
           IgnorePointer(
            child: AnimationScreen(
              color: AppTheme.colors.primary),
              )],
            ),
          );
        }),
      ),
    );
  }
}

