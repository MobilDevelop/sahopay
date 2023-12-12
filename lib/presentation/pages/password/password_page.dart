import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/application/password/password_cubit.dart';
import 'package:sahopay/application/password/password_state.dart';
import 'package:sahopay/presentation/components/button/border_button.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:sahopay/presentation/pages/password/components/password_widget.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PasswordCubit(),
    child: BlocListener<PasswordCubit,PasswordState>(listener: (_, state) {
      
    },
    child: Builder(builder: (context) {
      final cubit = context.read<PasswordCubit>();
      return BlocBuilder<PasswordCubit,PasswordState>(builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          elevation: 0,
           leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: SvgPicture.asset(AppIcons.back,color: AppTheme.colors.white)),
          title: Text(tr('password.title'),style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.white)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
            Gap(ScreenSize.h14),
            PassworWidget(title: tr("password.current"), controller: cubit.currentPassController),
            Gap(ScreenSize.h14),
            PassworWidget(title: tr('password.newpass'), controller: cubit.currentPassController),
            Gap(ScreenSize.h14),
            PassworWidget(title: tr('password.confirmpass'), controller: cubit.currentPassController),
              ],
            ),
             Container(
            margin: EdgeInsets.only(left: ScreenSize.w14,right: ScreenSize.w14,bottom: ScreenSize.h24),
            child: Row(
              children: [
                Expanded(child: BorderButton(onPressed:(){}, text: tr('password.clear'),borderColor: AppTheme.colors.red)),
                Gap(ScreenSize.w10),
                Expanded(child: BorderButton(onPressed:(){}, text: tr('password.update'))),
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