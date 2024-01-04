import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sahopay/application/forgotPass/forgotPass_cubit.dart';
import 'package:sahopay/application/forgotPass/forgotPass_state.dart';
import 'package:sahopay/presentation/pages/login/components/succes_code_bottom_widget.dart';
import 'package:sahopay/presentation/pages/login/components/succes_code_title.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:sahopay/presentation/routes/index_routes.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key, required this.param});
  final Map<String,dynamic> param;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ForgotPassCubit(),
     child:  BlocListener<ForgotPassCubit,ForgotPassState>(listener: (_, state) { 
      if(state is ForgotPassNextLogin){
        context.go(Routes.login.path);
      } 
     },
     child: Builder(builder: (context) {
       final cubit = context.read<ForgotPassCubit>();
       return BlocBuilder<ForgotPassCubit,ForgotPassState>(builder: (_, state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
          Gap(ScreenSize.h32),
          const SuccesCodeTitle(),
          Gap(60.h),
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
          Gap(100.h),
          SuccesCodeBottomWidget(
                    controller: cubit.timerController ,
                    resendPress:()=>cubit.resendCode(context,param), 
                    backPress:(){
                      Navigator.pop(context);
                    },
                    succesPress:cubit.succesCode, 
                    visible:true, 
                   showResend: cubit.showResend,
                   resendShow:cubit.resendCodeShow)
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