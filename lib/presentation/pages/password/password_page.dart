import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sahopay/application/password/password_cubit.dart';
import 'package:sahopay/application/password/password_state.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/button/border_button.dart';
import 'package:sahopay/presentation/pages/login/components/text_widget.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PasswordCubit(),
    child: BlocListener<PasswordCubit,PasswordState>(listener: (_, state) {
      if(state is PasswordMessage){
        Navigator.pop(context);
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ScreenSize.w12, vertical: ScreenSize.h14),
                    child: Column(
                      children: [
                    TextWidget(controller: cubit.currentPassController,
                    title:  tr("password.current"),
                    hintText: tr('login_page.error2'),
                    border: cubit.passwordBorder, 
                    visible: true, 
                    overflow: cubit.passwordVisible, 
                    showText:()=>cubit.visiblePassword(1)
                    ),
                    Gap(ScreenSize.h14),
                    TextWidget(controller: cubit.newPassController,
                    title:  tr("password.newpass"),
                    hintText: tr('login_page.error2'),
                    border: cubit.newPasswordBorder, 
                    visible: true, 
                    overflow: cubit.newPasswordVisible, 
                    showText:()=>cubit.visiblePassword(2)
                    ),
                    Gap(ScreenSize.h14),
                    TextWidget(controller: cubit.confirmPassController,
                    title:  tr("password.confirmpass"),
                    hintText: tr('login_page.error3'),
                    border: cubit.confirmPasswordBorder, 
                    visible: true, 
                    overflow: cubit.confirmPasswordVisible, 
                    showText:()=>cubit.visiblePassword(3)
                    ),
                    ],
                    ),
                  ),
                  Gap(200.h),
                   Container(
                  margin: EdgeInsets.only(left: ScreenSize.w14,right: ScreenSize.w14,bottom: ScreenSize.h24),
                  child: Row(
                    children: [
                      Expanded(child: BorderButton(onPressed: cubit.clearText, text: tr('password.clear'),borderColor: AppTheme.colors.red)),
                      Gap(ScreenSize.w10),
                      Expanded(child: BorderButton(onPressed: cubit.updatePassword, text: tr('password.update'))),
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