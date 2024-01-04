import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sahopay/application/checkPass/checkPass_cubit.dart';
import 'package:sahopay/application/checkPass/checkPass_state.dart';
import 'package:sahopay/presentation/pages/login/components/check_password.dart';
import 'package:sahopay/presentation/pages/login/components/succes_code_bottom_widget.dart';
import 'package:sahopay/presentation/pages/login/components/text_widget.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';

class CheckPassPage extends StatelessWidget {
  const CheckPassPage({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CheckPassCubit(),
     child:  BlocListener<CheckPassCubit, CheckPassState>(listener: (_, state) {
      if(state is CheckPassNextLogin){
        context.go(Routes.login.path);
      }  
     },
     child: Builder(builder: (context) {
       final cubit = context.read<CheckPassCubit>();
       return BlocBuilder<CheckPassCubit,CheckPassState>(builder: (_, state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
          Gap(ScreenSize.h10),
          const CheckPasswordWidget(),
          Gap(ScreenSize.h20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.w14),
            child: PinCodeTextField(
            appContext: context,            
            length: 6,
            keyboardType: TextInputType.number,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10.r),
            fieldHeight: 45.h,
            fieldWidth: 40.h,
            activeColor: AppTheme.colors.primary,
            inactiveColor: AppTheme.colors.grey,
            activeFillColor: AppTheme.colors.primary.withOpacity(.1),
            inactiveFillColor: AppTheme.colors.white,
            selectedFillColor: AppTheme.colors.white12,
            selectedColor: AppTheme.colors.green,
            borderWidth: 1.5,
            ),
            animationDuration: const Duration(milliseconds: 300),
            //enableActiveFill: true,
            //errorAnimationController: errorController,
            controller: cubit.succesCodeController,
            onCompleted: (v) {
            print(tr('login_page.complated'));
            },
            onChanged: (value) {
            print(value);
            
            },
            beforeTextPaste: (text) {
            print("Allowing to paste $text");
            return true;
            },
          ),
          ),
          Gap(ScreenSize.h10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
            child: Column(
            children: [
               Gap(ScreenSize.h10),
              TextWidget(controller: cubit.passwordController,
                      title:  tr('login_page.pass'), 
                      hintText: tr('login_page.error2'),
                      border: cubit.borderPassword, 
                      visible: true, 
                      overflow: cubit.passwordVisible, 
                      showText:()=>cubit.visiblePassword(1)),
              Gap(ScreenSize.h10),
              TextWidget(
                   controller: cubit.confirmPasswordController,
                    title:  tr('login_page.confirm'), 
                    hintText: tr('login_page.error3'),
                    border: cubit.borderConfirm, 
                    visible: true, 
                    overflow: cubit.confirmpasswordVisible, 
                    showText:()=>cubit.visiblePassword(2)),
              Gap(ScreenSize.h32),
              SuccesCodeBottomWidget(
                    controller: cubit.timerController ,
                    resendPress:()=>cubit.resendCode(context,email), 
                    backPress:(){
                      Navigator.pop(context);
                    },
                    succesPress:cubit.emailSuccesCode, 
                    visible:true, 
                   showResend: cubit.showResend,
                   resendShow:cubit.resendCodeShow)
            ],
                  ),
          ),
              ],
            ),
        )
            )
          );
        }),
      ),
    );
  }
}