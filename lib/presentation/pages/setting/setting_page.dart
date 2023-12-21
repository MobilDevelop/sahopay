import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sahopay/application/setting/setting_cubit.dart';
import 'package:sahopay/application/setting/setting_state.dart';
import 'package:sahopay/presentation/assets/asset_index.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SettingCubit(),
     child:  BlocListener<SettingCubit,SettingState>(listener: (_, state) {
       
     },
     child: Builder(builder: (context) {
       final cubit = context.read<SettingCubit>();
       return BlocBuilder<SettingCubit,SettingState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
           leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: SvgPicture.asset(AppIcons.back,color: AppTheme.colors.white)),
          title: Text(tr('setting.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
        body: Column(
          children: [
            Gap(ScreenSize.h8),
             ListTile(
              onTap: (){
                context.push(Routes.profile.path);
              },
              contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.w8,vertical: 0),
              splashColor: AppTheme.colors.primary.withOpacity(.3),
              leading: SvgPicture.asset(AppIcons.profile,color: AppTheme.colors.primary,height: ScreenSize.h24),
              title: Text(tr('setting.profile'),style: AppTheme.data.textTheme.displaySmall),
            ),
             Divider(
              height: ScreenSize.h10,
              color: AppTheme.colors.grey,
            ),
             ListTile(
              onTap: (){
                context.push(Routes.password.path);
              },
              contentPadding: EdgeInsets.symmetric(horizontal: ScreenSize.w8,vertical: 0),
              splashColor: AppTheme.colors.primary.withOpacity(.3),
              leading: SvgPicture.asset(AppIcons.key,color: AppTheme.colors.primary,height: ScreenSize.h24),
              title: Text(tr('setting.password'),style: AppTheme.data.textTheme.displaySmall),
            ),
             Divider(
              height: ScreenSize.h10,
              color: AppTheme.colors.grey,
            ),
          ],
        ),
       ));
     },),
     ),
    );
  }
}