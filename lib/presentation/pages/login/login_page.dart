import 'package:flutter/material.dart';
import 'package:sahopay/presentation/components/button/border_button.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';
import 'components/circle_user_widget.dart';
import 'components/forgot_password.dart';
import 'components/login_widget.dart';
import 'components/text_widget.dart';
import 'library/login_library.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(),
    child:  BlocListener<LoginCubit,LoginState>(listener: (context, state) {
      if(state is LoginNextPin){
        context.go(Routes.pin.path,extra: 3);
      }else if(state is LoginError){
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
      }else if(state is LoginNextForgot){
        context.push(Routes.checkPass.path,extra:state.email);
      }
    },
    child: Builder(builder: (context) {
      final cubit = context.read<LoginCubit>();
      return BlocBuilder<LoginCubit,LoginState>(builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(ScreenSize.h32),
              SizedBox(
                height: 120.h,
                child: Gif(image: const AssetImage(AppIcons.logo),autostart: Autostart.loop,fit: BoxFit.fitWidth)), 
                Container(
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
                  child: Column(
                  children: [
                  cubit.forgotPassword?const ForgotPassword():const LoginWidget(),
                  Gap(ScreenSize.h10),
                  const CircleUserWidget(),
                  TextWidget(controller: cubit.loginController,
                  title:  tr('login_page.login'), 
                  hintText: tr('login_page.error1'),
                  border: cubit.borderEmail, 
                  visible: false, 
                  overflow: false, 
                  showText: (){}),
                  Visibility(
                    visible: !cubit.forgotPassword,
                    child: Column(
                    children: [TextWidget(controller: cubit.passwordController,
                    title:  tr('login_page.pass'), 
                    hintText: tr('login_page.error2'),
                    border: cubit.borderPassword, 
                    visible: true, 
                    overflow: cubit.passwordVisible, 
                    showText:cubit.visiblePassword
                    ),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(right: ScreenSize.w10),
                    child: Bounce(
                      duration: const Duration(milliseconds: 300),
                      onPressed:cubit.forgotP,
                      child: Text(tr('login_page.forget'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.primary),
                      textAlign: TextAlign.end),
                    ),
                  )],
                  )),
                 
                    ]),
                 ),
                 Container(
                  padding: EdgeInsets.only(left: ScreenSize.w12,right: ScreenSize.w12,bottom: ScreenSize.h32,top: 50.h),
                  child: Column(
                    children: [
                      Gap(ScreenSize.h16),
                      MainButton(text: tr('login_page.enter'),
                      wrap: true, 
                      showLoading: cubit.loading,
                      onPressed: ()=>cubit.forgotPassword?cubit.forgotPass(context):cubit.checkInfo(context)),
                       Gap(ScreenSize.h20),
                       cubit.forgotPassword?BorderButton(onPressed:cubit.forgotP, text: tr('login_page.back'),borderColor: AppTheme.colors.grey):
                       Padding(
                         padding:  EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(tr('login_page.comment2'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                            Bounce(
                              duration: const Duration(milliseconds: 300),
                              onPressed:(){
                                context.go(Routes.registration.path);
                              },
                              child: Text(tr('login_page.signup'),style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary))),
                          ],
                         ),
                       ),
                    ],
                  ),
                 )
            ]),
        ),
      ));
    },),
    ),
    );
  }
}