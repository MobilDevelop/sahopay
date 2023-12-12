import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/profile/profile_cubit.dart';
import 'package:sahopay/application/profile/profile_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/components/button/border_button.dart';

import 'components/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ProfileCubit(),
    child: BlocListener<ProfileCubit,ProfileState>(listener: (_, state) {
      
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Gap(ScreenSize.h20),
            ProfileWidget(controller: cubit.emailController, title: tr('profile.email')),
            Gap(ScreenSize.h10),
            ProfileWidget(controller: cubit.firtnameController, title: tr('profile.firstname')),
            Gap(ScreenSize.h10),
            ProfileWidget(controller: cubit.lastnameController, title: tr('profile.lastname')),
            Gap(ScreenSize.h10),
            ProfileWidget(controller: cubit.referalController, title: tr('profile.referal')),
              ],
            ),
          Container(
            margin: EdgeInsets.only(left: ScreenSize.w14,right: ScreenSize.w14,bottom: ScreenSize.h24),
            child: Row(
              children: [
                Expanded(child: BorderButton(onPressed:(){}, text: tr('profile.clear'),borderColor: AppTheme.colors.red)),
                Gap(ScreenSize.w10),
                Expanded(child: BorderButton(onPressed:(){}, text: tr('profile.update'))),
              ],
            ),
          )
          ],
        ),
      ));
    },),
    ),
    );
  }
}