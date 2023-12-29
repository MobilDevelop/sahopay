import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/login/login_state.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/login/captcha.dart';
import 'package:sahopay/infrastructure/models/login/forgot_pass.dart';
import 'package:sahopay/infrastructure/models/login/login_send.dart';
import 'package:sahopay/infrastructure/models/login/registration_send_info.dart';
import 'package:sahopay/infrastructure/models/login/set_password.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';
import 'package:sahopay/presentation/pages/login/components/captcha_widget.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());
  
  bool loading =false;
  bool onRegistration = false;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  bool checked = false;
  bool forgotPassword = false;
  bool succesCode = false;

  bool borderEmail =false;
  bool borderPassword =false;
  bool borderConfirm =false;
  bool borderCheck =false;
  bool checkPassword = false;

  final loginController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final referalController=TextEditingController();
  final captchaController=TextEditingController();
  final succesCodeController=TextEditingController();


  void checkInfo(context)async{
    String login = loginController.text.trim();
    String password = passwordController.text.trim();
    String confirm = confirmPasswordController.text.trim();
    loading =true;
    emit(LoginInitial());
  
    if(onRegistration){
      if(login.isEmpty || password.isEmpty || confirm.isEmpty){
       loading=false;
       emit(LoginError(tr("universal.fillInfo")));
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
       if(confirm.length<4 || confirm!=password){
          borderConfirm =true;
       }else{
        borderConfirm=false;
       }
       if(!checked){
        borderCheck=true;
       }else{
        borderCheck=false;
       }

      if(!borderPassword && !borderConfirm && !borderCheck && !borderEmail){
        GetCaptcha  captcha = await RegistrationServices().getCaptcha();
         showDialog(context: context, builder: (context) => CaptchaWidget(image: captcha.photoUrl,controller: captchaController, press:(){
          Navigator.pop(context);
          loading =true;
          emit(LoginInitial());
          registration(captcha);
         }));
         }
      }
    }
    else{
      if(login.isEmpty || password.isEmpty){
       loading=false;
       emit(LoginError(tr("universal.fillInfo")));

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
          loading =true;
          emit(LoginInitial());
          bool check = await RegistrationServices().login(LoginSend(username: login, password: password).toJson());
          if(check){
            emit(LoginNextPin());
          }else{
            emit(LoginError(tr("pin.notfound")));
          }
       }
    }
    }
    loading=false;
    emit(LoginInitial());
  }


  void registration(GetCaptcha captcha)async{
    Map<String,dynamic> sendInfo = RegistrationSendInfo(
    answer: captchaController.text.trim(), 
    email: loginController.text.trim(), 
    password:passwordController.text.trim(), 
    referalCode: referalController.text.trim(), 
    termsAndCantion: checked, 
    captchaRandomId: captcha.randomId).toJson();

    ServerMessage getInfo = await RegistrationServices().registration(sendInfo);
      loading=false;
    if(getInfo.code==200){
      succesCode=true;
      checkPassword=false;
    }             
    emit(LoginInitial());
  }


  void emailSuccesCode()async{
    loading =true;
    String code = succesCodeController.text.trim();
    emit(LoginInitial());
    if(code.length<6){
      emit(LoginError(tr("pin.character")));
    }else{
      String password = passwordController.text.trim();
      String confirm = confirmPasswordController.text.trim();
      if(checkPassword){
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
        emit(LoginError(info.message));
        if(info.code==200){
          succesCode =false;
          onRegistration=false;
          checkPassword=false;
        }

      }

    }else{
      ServerMessage getResponse = await RegistrationServices().emeailCodeSucces(code);
      emit(LoginError(getResponse.message));
      if(getResponse.code==200){
        succesCode=false;
        onRegistration=false;
    }
    }
    }
    loading =false;
    emit(LoginInitial());
  }


  void forgotPass(context)async{
      loading = true;
      emit(LoginInitial());
      String email = loginController.text.trim();
       if(Helper.isEmail(email)){
        borderEmail=true;
       }else{
        borderEmail=false;
       }
      if(!borderEmail){
           GetCaptcha  captcha = await RegistrationServices().getCaptcha();
      showDialog(context: context, builder: (context) => CaptchaWidget(image: captcha.photoUrl,controller: captchaController, press:(){
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
    ServerMessage info = await RegistrationServices().forgotPass(ForgotPasswordJson(answer: captchaController.text.trim(), mail: mail, randomId: captcha.randomId).toJson());
    loading=false;
    if(info.code==200){
      onRegistration=false;
      forgotPassword=false;
      succesCode =true;
      checkPassword=true;
    }
    emit(LoginError(info.message));
  }



  void checkView(){
    onRegistration = !onRegistration;
    emit(LoginInitial());
  }



  void visiblePassword(int type){
    if(type==1){
      passwordVisible=!passwordVisible;
    }else{
      confirmpasswordVisible=!confirmpasswordVisible;
    }
    emit(LoginInitial());
  }


   showChecked(bool? value){
    checked=!checked;
    emit(LoginInitial());
  }


  void showForgotPassword(){
    forgotPassword =!forgotPassword;
    emit(LoginInitial());
  }
}