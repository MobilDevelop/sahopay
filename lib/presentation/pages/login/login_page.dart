import 'package:flutter/material.dart';
import 'package:sahopay/presentation/components/button/border_button.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';
import 'components/circle_user_widget.dart';
import 'components/forgot_password.dart';
import 'components/login_widget.dart';
import 'components/registration_widget.dart';
import 'components/text_widget.dart';
import 'library/login_library.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(),
    child:  BlocListener<LoginCubit,LoginState>(listener: (context, state) {
      if(state is LoginNextHome){
        context.go(Routes.home.path);
      }
    },
    child: Builder(builder: (context) {
      final cubit = context.read<LoginCubit>();
      return BlocBuilder<LoginCubit,LoginState>(builder: (context, state) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Gap(ScreenSize.h32),
            SizedBox(
              height: 150.h,
              child: Gif(image: const AssetImage(AppIcons.logo),autostart: Autostart.loop,fit: BoxFit.fitWidth,)), 
              Expanded(child: Container(
                margin: EdgeInsets.symmetric(horizontal: ScreenSize.w20),
                padding: EdgeInsets.symmetric(horizontal: ScreenSize.w18,vertical: ScreenSize.h8),
                width: double.maxFinite,
                decoration: BoxDecoration(
              color: AppTheme.colors.white,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: AppTheme.colors.primary.withOpacity(.3),
                width: 2
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 15,
                  color: Colors.grey.shade400,
                  offset: Offset(18.w,18.h)
                )
              ]),
                child: SingleChildScrollView(
                  child: Column(
                children: [
                  cubit.forgotPassword?const ForgotPassword():cubit.chooseView?const RegistrationWidget():const LoginWidget(),
                  Gap(ScreenSize.h10),
                  const CircleUserWidget(),
                  TextWidget(controller: cubit.loginController,title:  tr('login_page.login'), border: false, visible: false, overflow: false, showText: (){}),
                  Visibility(
                    visible: !cubit.forgotPassword,
                    child: Column(
                    children: [TextWidget(controller: cubit.passwordController,title:  tr('login_page.pass'), border: false, visible: true, overflow: cubit.passwordVisible, showText:()=>cubit.visiblePassword(1)),
                  Visibility(
                    visible: !cubit.chooseView,
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(right: ScreenSize.w10),
                      child: Bounce(
                        duration: const Duration(milliseconds: 300),
                        onPressed:cubit.showForgotPassword,
                        child: Text("Forgot password?",style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary),
                        textAlign: TextAlign.end),
                      ),
                    ),
                  )],
                  )),
                  Visibility(
                    visible: cubit.chooseView,
                    child: Column(
                      children: [
                  TextWidget(controller: cubit.confirmPasswordController,title:  tr('login_page.confirm'), border: true, visible: true, overflow: cubit.confirmpasswordVisible, showText:()=>cubit.visiblePassword(2)),
                  TextWidget(controller: cubit.referalController,title:  tr('login_page.referal'), border: true, visible: false, overflow:false, showText:(){}),
                  Row(
                    children: [
                      Checkbox(value: cubit.checked, onChanged: cubit.showChecked,activeColor: AppTheme.colors.primary),
                      Text("Agree with",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey)),
                      Gap(ScreenSize.w10),
                      Text("Terms & Condition",style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary)),
                    ],
                  )
                      ],
                    )),
                    ]),
                ),
               )),
               Container(
                padding: EdgeInsets.only(left: ScreenSize.w12,right: ScreenSize.w12,bottom: ScreenSize.h32,top: ScreenSize.h24),
                child: Column(
                  children: [
                    Gap(ScreenSize.h16),
                    MainButton(text: tr('login_page.enter'),
                    wrap: true, 
                    showLoading: cubit.loading,
                    onPressed: cubit.checkInfo),
                     Gap(ScreenSize.h20),
                     cubit.forgotPassword?BorderButton(onPressed:cubit.showForgotPassword, text: "Back",borderColor: AppTheme.colors.grey):Padding(
                       padding:  EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(cubit.chooseView?tr('login_page.comment1'):tr('login_page.comment2'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                          Bounce(
                            duration: const Duration(milliseconds: 300),
                            onPressed:cubit.checkView,
                            child: Text(cubit.chooseView?tr('login_page.signin'):tr('login_page.signup'),style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary))),
                        ],
                       ),
                     ),
                  ],
                ),
               )
          ]),
      ));
    },),
    ),
    );
  }
}

