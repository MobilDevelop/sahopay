import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/application/checkPass/checkPass_state.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/infrastructure/models/login/captcha.dart';
import 'package:sahopay/infrastructure/models/login/forgot_pass.dart';
import 'package:sahopay/infrastructure/models/login/set_password.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';
import 'package:sahopay/presentation/pages/login/components/captcha_widget.dart';
import 'package:timer_count_down/timer_controller.dart';

class CheckPassCubit extends Cubit<CheckPassState>{

  CheckPassCubit() : super(CheckPassInitial());

  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final succesCodeController=TextEditingController();
  final captchaController=TextEditingController();

  final timerController = CountdownController(autoStart: true);

  bool borderPassword =false;
  bool borderConfirm =false;
  bool showResend = false;
  bool loading =false;

  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  
  
  void emailSuccesCode()async{
    loading =true;
    String code = succesCodeController.text.trim();
    emit(CheckPassInitial());
    if(code.length<6){
      EasyLoading.showInfo(tr("pin.character"));
    }else{
      String password = passwordController.text.trim();
      String confirm = confirmPasswordController.text.trim();
      
      if(password.length<4){
        borderPassword=true;
       }else{
        borderPassword=false;
       }
       if(confirm.length<4 || confirm!=password){
          borderConfirm =true;
       }else{
        borderConfirm=false;
       }

      if(!borderPassword && !borderConfirm){
        ServerMessage info = await RegistrationServices().setPassword(SetPassword(newPassword: password, key: code).toJson());
         EasyLoading.showInfo(info.message);
        if(info.code==200){
          emit(CheckPassNextLogin());
        }

      }
    }
    loading =false;
    emit(CheckPassInitial());
  }


  void resendCode(context,String email)async{
    if(showResend){
       captchaController.clear();
         showDialog(context: context, builder: (context) => CaptchaWidget(
      controller: captchaController, 
      press:(GetCaptcha captcha)async{
          Navigator.pop(context);
          loading =true;
          emit(CheckPassInitial());          
          ServerMessage info = await RegistrationServices().forgotPass(ForgotPasswordJson(
          answer: captchaController.text.trim(), 
         mail: email, randomId: captcha.randomId).toJson());
    if(info.code==200){
    timerController.restart();
    showResend=false;
     succesCodeController.clear();
     EasyLoading.showInfo(info.message);
    }
    }));
      }
      loading =false;
      emit(CheckPassInitial());
  }
  
  
  void resendCodeShow(){
    showResend=true;
    emit(CheckPassInitial());
  }
  
  void visiblePassword(int type){
    if(type==1){
      passwordVisible=!passwordVisible;
    }else{
      confirmpasswordVisible=!confirmpasswordVisible;
    }
    emit(CheckPassInitial());
  }

}