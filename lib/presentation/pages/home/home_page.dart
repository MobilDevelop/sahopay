import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sahopay/application/home/home_cubit.dart';
import 'package:sahopay/application/home/home_state.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context) => HomeCubit(),
    child: BlocListener<HomeCubit,HomeState>(listener: (_, state) {
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<HomeCubit>();
      return BlocBuilder<HomeCubit,HomeState>(builder: (_, state) => Scaffold(
        body: Column(
          children: [
            Expanded(child: cubit.screens[cubit.currentPage]),
            Container(
              height: 60.h,
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: ScreenSize.h20,left: ScreenSize.w10,right: ScreenSize.w10),
              padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10,vertical: ScreenSize.h10),
              decoration: BoxDecoration(
                color: AppTheme.colors.primary.withOpacity(.2),
                borderRadius: BorderRadius.circular(25.r)
              ),
              child: Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      Container(
                        height: 2.h,
                        width: double.maxFinite,
                        color: AppTheme.colors.primary,
                      )
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
)
      );
    },),
    ),
    );
  }
}