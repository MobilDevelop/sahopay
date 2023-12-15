import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sahopay/presentation/pages/login/components/text_widget.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
class SuccesCodePincodeWidget extends StatelessWidget {
  const SuccesCodePincodeWidget({
    super.key, required this.controller, required this.visible, required this.passwordController, required this.confirmPasswordController, required this.borderColorPass, required this.borderColorConfirm, required this.pressPass, required this.passwordVisible, required this.confirmpasswordVisible,
  });
   final TextEditingController controller;
   final bool visible;
   final TextEditingController passwordController;
   final TextEditingController confirmPasswordController;
   final bool borderColorPass;
   final bool borderColorConfirm;
   final Function pressPass;
   final bool passwordVisible;
   final bool confirmpasswordVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
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
          controller: controller,
          onCompleted: (v) {
          print("Completed");
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
        Visibility(
          visible: visible,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
            child: Column(
            children: [
               Gap(ScreenSize.h32),
              TextWidget(controller: passwordController,
                      title:  tr('login_page.pass'), 
                      hintText: tr('login_page.error2'),
                      border: borderColorPass, 
                      visible: true, 
                      overflow: passwordVisible, 
                      showText:()=>pressPass(1)),
              Gap(ScreenSize.h10),
              TextWidget(controller: confirmPasswordController,
                    title:  tr('login_page.confirm'), 
                    hintText: tr('login_page.error3'),
                    border: borderColorConfirm, 
                    visible: true, 
                    overflow: confirmpasswordVisible, 
                    showText:()=>pressPass(2)),     
            ],
                  ),
          ))
      ],
    );
  }
}