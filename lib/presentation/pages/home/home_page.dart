import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahopay/application/home/home_cubit.dart';
import 'package:sahopay/application/home/home_state.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';
import 'package:sahopay/presentation/pages/drawer/drawer_page.dart';
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
      return BlocBuilder<HomeCubit,HomeState>(builder: (_, state) => WillPopScope(
        onWillPop: ()=>cubit.onWillPop(),
        child: Scaffold(
          key: cubit.scaffoldkey,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              cubit.window ?? Container(),
              MediaQuery.of(context).viewInsets.bottom==0?Container(
                height: 55.h,
                width: double.maxFinite,
                margin: EdgeInsets.only(bottom: ScreenSize.h16,left: ScreenSize.w18,right: ScreenSize.w18),
                //padding: EdgeInsets.only(left: ScreenSize.w10,right:ScreenSize.w10),
                decoration: BoxDecoration(
                  color: AppTheme.colors.white.withOpacity(.6),
                  border: Border.all(
                    color: AppTheme.colors.primary
                  ),
                  borderRadius: BorderRadius.circular(16.r),
               
                ),
                child: Row(
                  children: [
                    BottomWidget(icon: AppIcons.dashboard, 
                    title: tr('home.dashboard'),
                    type: 1,
                    onPress: cubit.currentPage==0, 
                    press: ()=>cubit.nextScreen(0)),
                    BottomWidget(icon: AppIcons.money, 
                    title: tr('home.deposit'),
                    type: 0,
                    onPress: cubit.currentPage==1, 
                    press: ()=>cubit.nextScreen(1)),
                    BottomWidget(icon: AppIcons.exchange, 
                    title: tr('home.exchange'), 
                    onPress: cubit.currentPage==2,
                    type: 0,
                    press: ()=>cubit.nextScreen(2),size: "test"),
                    BottomWidget(icon: AppIcons.history, 
                    title: tr('home.history'),
                    type: 2,
                    onPress: cubit.currentPage==3, 
                    press: ()=>cubit.nextScreen(3)),
                  ],
                ),
              ):const SizedBox()
            ],
          ),
          drawer: DrawerPage(profileInfo: cubit.profileInfo),
        ),
      )
      );
    },),
    ),
    );
  }
}

