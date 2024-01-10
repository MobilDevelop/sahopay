import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/application/login/login_state.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/login/captcha.dart';
import 'package:sahopay/infrastructure/models/login/forgot_pass.dart';
import 'package:sahopay/infrastructure/models/login/login_send.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';
import 'package:sahopay/presentation/pages/login/components/captcha_widget.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());
  
  bool loading =false;
  bool forgotPassword = false;

  bool onRegistration = false;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  bool checked = false;
  bool succesCode = false;
  bool showResend = false;

  bool borderEmail =false;
  bool borderPassword =false;
  bool borderConfirm =false;
  bool borderCheck =false;
  bool checkPassword = false;

  String timer = "01:00";

  final loginController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final referalController=TextEditingController();
  final captchaController=TextEditingController();
  final succesCodeController=TextEditingController();



  void checkInfo(context)async{
    String login = loginController.text.trim();
    String password = passwordController.text.trim();
    loading =true;
    emit(LoginInitial());

      if(login.isEmpty || password.isEmpty){
       loading=false;

       EasyLoading.showInfo(tr("universal.fillInfo"));

    }else{
      if(Helper.isEmail(login)){
        borderEmail=true;
       }else{
        borderEmail=false;
       }
       if(password.length<4){
        borderPassword=true;
       }else{
        borderPassword=false;
       }

       if(!borderPassword && !borderEmail){
          bool check = await RegistrationServices().login(LoginSend(username: login, password: password).toJson());
          if(check){
            emit(LoginNextPin());
          }
       }
    }
    loading=false;
    emit(LoginInitial());
  }


  

  void forgotPass(context)async{
      loading = true;
      emit(LoginInitial());
      String email = loginController.text.trim();
       if(email.isEmpty){
        borderEmail=true;
       }else{
        borderEmail=false;
       }
      if(!borderEmail){
        captchaController.clear();
      showDialog(context: context, builder: (context) => CaptchaWidget(
      controller: captchaController, press:(GetCaptcha captcha){
          Navigator.pop(context);
          loading =true;
          emit(LoginInitial());
          checkForgotPassword(captcha,email);
         }));
      }
      loading = false;
      emit(LoginInitial());
  }

 
  void checkForgotPassword(GetCaptcha captcha,String mail)async{
    ServerMessage info = await RegistrationServices().forgotPass(ForgotPasswordJson(answer: captchaController.text.trim(), 
    mail: mail, randomId: captcha.randomId).toJson());
     EasyLoading.showInfo(info.message);
    if(info.code==200){
     emit(LoginNextForgot(mail)); 
    }
    loading=false;
    emit(LoginInitial());
  }




  void visiblePassword(){
    passwordVisible=!passwordVisible;
    emit(LoginInitial());
  }

  void forgotP(){
    forgotPassword=!forgotPassword;
    emit(LoginInitial());
  }

  void resendCode(context)async{
    if(showResend){
       String email = loginController.text.trim();
       captchaController.clear();
         showDialog(context: context, builder: (context) => CaptchaWidget(
      controller: captchaController, 
      press:(GetCaptcha captcha){
          Navigator.pop(context);
          loading =true;
          emit(LoginInitial());
          if(checkPassword){
            checkForgotPassword(captcha,email);
          }else{
          }
         }));
      }
  }
}