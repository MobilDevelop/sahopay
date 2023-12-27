import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/profile/profile_cubit.dart';
import 'package:sahopay/application/profile/profile_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/button/border_button.dart';

import 'components/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProfileCubit(),
    child: BlocListener<ProfileCubit,ProfileState>(listener: (_, state) {
      if(state is ProfileClose){
        Navigator.pop(context);
      }
    },
    child: Builder(builder: (context) {
      final cubit = context.read<ProfileCubit>();
      return BlocBuilder<ProfileCubit,ProfileState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
           leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: SvgPicture.asset(AppIcons.back,color: AppTheme.colors.white)),
          title: Text(tr('profile.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Gap(ScreenSize.h20),
                  Container(
                  margin: EdgeInsets.symmetric(horizontal: ScreenSize.w12),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Text(tr('profile.email'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),
                 Gap(ScreenSize.h4),
                 Container(
                  height: 45.h,
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: AppTheme.colors.grey
                    ),
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: TextField(
                  style: TextStyle(color: AppTheme.colors.grey),
                    enabled: cubit.check,
                    controller: cubit.emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none
                    ),
                  ),
                ),
              ],
                  ),
                ),
                  Gap(ScreenSize.h10),
                  ProfileWidget(controller: cubit.firtnameController, title: tr('profile.firstname')),
                  Gap(ScreenSize.h10),
                  ProfileWidget(controller: cubit.lastnameController, title: tr('profile.lastname')),
                  Gap(ScreenSize.h10),
                   Container(
                  margin: EdgeInsets.symmetric(horizontal: ScreenSize.w12),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 Text(tr('profile.referal'),style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.black)),
                 Gap(ScreenSize.h4),
                 Container(
                  height: 45.h,
                  width: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: AppTheme.colors.grey
                    ),
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: TextField(
                    enabled: cubit.check,
                    controller: cubit.referalController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none
                    ),
                  ),
                ),
              ],
                  ),
                ),
                    ],
                  ),
                  Gap(200.h),
                Container(
                  margin: EdgeInsets.only(left: ScreenSize.w14,right: ScreenSize.w14,bottom: ScreenSize.h24),
                  child: Row(
                    children: [
                      Expanded(child: BorderButton(onPressed:cubit.clear, text: tr('profile.clear'),borderColor: AppTheme.colors.red)),
                      Gap(ScreenSize.w10),
                      Expanded(child: BorderButton(onPressed:cubit.setProfile, text: tr('profile.update'))),
                    ],
                  ),
                )
                ],
              ),
            ),
            Visibility(
              visible: cubit.loading,
              child: const Loading())
          ],
        ),
      ));
    },),
    ),
    );
  }
}