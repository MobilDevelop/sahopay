import 'package:gap/gap.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahopay/application/drawer/drawer_cubit.dart';
import 'package:sahopay/application/drawer/drawer_state.dart';
import 'package:sahopay/infrastructure/models/profile/profile.dart';
import 'package:sahopay/presentation/assets/res/app_icons.dart';
import 'package:sahopay/presentation/assets/res/screen_size.dart';
import 'package:sahopay/presentation/assets/theme/app_theme.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key, required this.profileInfo});
   final ProfileModel profileInfo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => DrawerCubit(),
    child: BlocListener<DrawerCubit,DrawerState>(listener: (_, state) {
      if(state is DrawerNextTransfer){
        Navigator.pop(context);
        context.push(Routes.transfer.path);
      }else if(state is DrawerNextSetting){
        Navigator.pop(context);
        context.push(Routes.setting.path);
      }else if(state is DrawerNextWithdraw){
        Navigator.pop(context);
        context.push(Routes.withdraw.path);
      } else if(state is DrawerNextLogin){
        context.go(Routes.login.path);
      } else if(state is DrawerNextPin){
        context.push(Routes.pin.path);
      }
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<DrawerCubit>();
      return BlocBuilder<DrawerCubit,DrawerState>(builder: (_, state) => Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Column(
            children: [
               Gap(60.h),
            ListTile(
              leading: Container(
                height: 45.h,
                width: 45.h,
                padding: EdgeInsets.all(ScreenSize.h4),
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.colors.background,
                  border: Border.all(
                    color: AppTheme.colors.primary
                  ),
                  boxShadow: [
            BoxShadow(
              color: AppTheme.colors.grey.withOpacity(.6),
              blurRadius: 8,
              spreadRadius: 3,
              offset: Offset(3.w, 4.h)
            )
          ],
                ),
          child: SvgPicture.asset(AppIcons.user,color: AppTheme.colors.primary),
              ),
              title: Text("${profileInfo.lastName} \n${profileInfo.firstName}",style: AppTheme.data.textTheme.bodyMedium),
              subtitle:Text(profileInfo.email,style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.grey)),
            ),
            Gap(60.h),
            Divider(
              height: 2.h,
              color: AppTheme.colors.grey,
            ),
             ListTile(
              onTap: ()=>cubit.nextPage(1),
              contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.w8,vertical: 0),
              splashColor: AppTheme.colors.primary.withOpacity(.3),
              leading: SvgPicture.asset(AppIcons.send,color: AppTheme.colors.primary,height: ScreenSize.h24),
              title: Text(tr('home.transfer'),style: AppTheme.data.textTheme.headlineMedium),
            ),
             Divider(
              height: 2.h,
              color: AppTheme.colors.grey,
            ),
            ListTile(
              onTap: ()=>cubit.nextPage(2),
              contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.w8,vertical: 0),
              splashColor: AppTheme.colors.primary.withOpacity(.3),
              leading: SvgPicture.asset(AppIcons.withdraw,color: AppTheme.colors.primary,height: ScreenSize.h24),
              title: Text(tr('home.withdraw'),style: AppTheme.data.textTheme.headlineMedium),
            ),
             Divider(
              height: 2.h,
              color: AppTheme.colors.grey,
            ),
            ListTile(
              onTap: ()=>cubit.nextPage(3),
              contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.w8,vertical: 0),
              splashColor: AppTheme.colors.primary.withOpacity(.3),
              leading: SvgPicture.asset(AppIcons.setting,color: AppTheme.colors.primary,height: ScreenSize.h24),
              title: Text(tr('home.setting'),style: AppTheme.data.textTheme.headlineMedium),
            ),
            
             Divider(
              height: 2.h,
              color: AppTheme.colors.grey,
            ),
            ],
           ),
           Column(
             children: [
               Bounce(
                    duration: const Duration(milliseconds: 200),
                    onPressed: (){
                     AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.bottomSlide,
                title: 'Rostdan ham',
                desc: 'chiqmoqchimisiz?',
                btnCancelText: "YO'Q",
                btnOkText: "HA",
                btnCancelOnPress: () {
                },
                btnOkOnPress:cubit.logOut,
                ).show();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Gap(ScreenSize.w24),
                        SvgPicture.asset(AppIcons.logout,color: AppTheme.colors.red,height: ScreenSize.h24),
                        Gap(ScreenSize.w12),
                        Text(tr('drawer.exit'),style: AppTheme.data.textTheme.displayLarge!.copyWith(color: AppTheme.colors.red),),
                      ],
                    ),
               ),
                Gap(ScreenSize.h32)
               ],
              ),
            ]),
          ),
        );
      }),
      ),
    );
  }
}