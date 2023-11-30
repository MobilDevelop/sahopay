import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahopay/application/home/home_cubit.dart';
import 'package:sahopay/application/home/home_state.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';

import 'components/bottom_widget.dart';

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
              height: 55.h,
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: ScreenSize.h16,left: ScreenSize.w6,right: ScreenSize.w6),
              padding: EdgeInsets.only(left: ScreenSize.w6,right:ScreenSize.w6),
              decoration: BoxDecoration(
                color: AppTheme.colors.white,
                border: Border.all(
                  color: AppTheme.colors.primary
                ),
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 10,
                    spreadRadius:5,
                    offset: Offset(4.w,8.h)
                  )
                ]
              ),
              child: Row(
                children: [
                  BottomWidget(icon: AppIcons.dashboard, title: tr('home.dashboard'), onPress: 0==cubit.currentPage, press: ()=>cubit.nextScreen(0)),
                  BottomWidget(icon: AppIcons.money, title: tr('home.deposit'), onPress: 1==cubit.currentPage, press: ()=>cubit.nextScreen(1)),
                  BottomWidget(icon: AppIcons.send, title: tr('home.transfer'), onPress: 2==cubit.currentPage, press: ()=>cubit.nextScreen(2)),
                  BottomWidget(icon: AppIcons.exchange, title: tr('home.exchange'), onPress: 3==cubit.currentPage, press: ()=>cubit.nextScreen(3)),
                  BottomWidget(icon: AppIcons.history, title: tr('home.history'), onPress: 4==cubit.currentPage, press: ()=>cubit.nextScreen(4)),
                  BottomWidget(icon: AppIcons.setting, title: tr('home.setting'), onPress: 5==cubit.currentPage, press: ()=>cubit.nextScreen(5)),
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

