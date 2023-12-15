import 'package:flutter/material.dart';
import 'package:sahopay/presentation/components/animation_loading/loading.dart';
import 'package:sahopay/presentation/components/button/border_button.dart';
import 'package:sahopay/presentation/pages/login/components/check_password.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';
import 'components/circle_user_widget.dart';
import 'components/forgot_password.dart';
import 'components/login_widget.dart';
import 'components/registration_widget.dart';
import 'components/succes_code_bottom_widget.dart';
import 'components/succes_code_title.dart';
import 'components/succes_pincode_widget.dart';
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
      } 
    },
    child: Builder(builder: (context) {
      final cubit = context.read<LoginCubit>();
      return BlocBuilder<LoginCubit,LoginState>(builder: (context, state) => Scaffold(
        body: cubit.succesCode?SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Gap(50.h),
                    cubit.checkPassword?const CheckPasswordWidget():  const SuccesCodeTitle(),
                    Gap(90.h),
                   SuccesCodePincodeWidget(controller: cubit.succesCodeController, 
                   visible:cubit.checkPassword,
                   passwordController: cubit.passwordController,
                   confirmPasswordController: cubit.confirmPasswordController,
                   passwordVisible: cubit.passwordVisible,
                   confirmpasswordVisible: cubit.confirmpasswordVisible,
                   borderColorPass: cubit.borderPassword,
                   borderColorConfirm: cubit.borderConfirm,
                   pressPass:(int index)=>cubit.visiblePassword(index)),
                   cubit.checkPassword? Gap(80.h):Gap(120.h),
                   SuccesCodeBottomWidget(resendPress: () {  }, succesPress:cubit.emailSuccesCode, visible:cubit.checkPassword)
                  ],
                ),
              ),
              Visibility(
                visible: cubit.loading,
                child: const Loading())
            ],
          ),
        ):SingleChildScrollView(
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
                  cubit.forgotPassword?const ForgotPassword():cubit.onRegistration?const RegistrationWidget():const LoginWidget(),
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
                    showText:()=>cubit.visiblePassword(1)),
                  Visibility(
                    visible: !cubit.onRegistration,
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
                    visible: cubit.onRegistration,
                    child: Column(
                      children: [
                  TextWidget(controller: cubit.confirmPasswordController,
                  title:  tr('login_page.confirm'), 
                  hintText: tr('login_page.error3'),
                  border: cubit.borderConfirm, 
                  visible: true, 
                  overflow: cubit.confirmpasswordVisible, 
                  showText:()=>cubit.visiblePassword(2)),
                  TextWidget(controller: cubit.referalController,
                  title:  tr('login_page.referal'), 
                  hintText: "",
                  border:  false, 
                  visible: false, 
                  overflow:false, 
                  showText:(){}),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: cubit.borderCheck?AppTheme.colors.red:AppTheme.colors.grey
                            ),
                            child: Checkbox(value: cubit.checked, 
                            onChanged: cubit.showChecked,
                            activeColor: AppTheme.colors.primary), 
                          ),
                          Text("Agree with",style: AppTheme.data.textTheme.titleSmall!.copyWith(color: AppTheme.colors.grey)),
                          Gap(ScreenSize.w10),
                          Text("Terms & Condition",style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary)),
                        ],
                      ),
                      Visibility(
                        visible: cubit.borderCheck,
                        child: Column(
                          children: [
                            Text(
                               tr('login_page.error4'),
                                style: AppTheme.data.textTheme.labelSmall!.copyWith(color: AppTheme.colors.red),
                                ),
                            Gap(ScreenSize.h16)
                          ],
                        ),
                      ),
                    ],
                  )
                      ],
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
                      onPressed: (){
                        if(!cubit.loading){
                         if(cubit.forgotPassword){
                          cubit.forgotPass(context);
                         }else{
                          cubit.checkInfo(context);
                         }
                        }
                      }),
                       Gap(ScreenSize.h20),
                       cubit.forgotPassword?BorderButton(onPressed:cubit.showForgotPassword, text: "Back",borderColor: AppTheme.colors.grey):Padding(
                         padding:  EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(cubit.onRegistration?tr('login_page.comment1'):tr('login_page.comment2'),style: AppTheme.data.textTheme.bodyMedium!.copyWith(color: AppTheme.colors.grey)),
                            Bounce(
                              duration: const Duration(milliseconds: 300),
                              onPressed:cubit.checkView,
                              child: Text(cubit.onRegistration?tr('login_page.signin'):tr('login_page.signup'),style: AppTheme.data.textTheme.titleMedium!.copyWith(color: AppTheme.colors.primary))),
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