import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:sahopay/application/login/login_state.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';
import 'package:sahopay/infrastructure/models/login/captcha.dart';
import 'package:sahopay/infrastructure/models/login/forgot_pass.dart';
import 'package:sahopay/infrastructure/models/login/login_send.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';
import 'package:sahopay/presentation/pages/login/components/captcha_widget.dart';
import 'dart:io' show Platform;

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

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  final loginController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final referalController=TextEditingController();
  final captchaController=TextEditingController();
  final succesCodeController=TextEditingController();



  void checkInfo(context)async{
    String login = loginController.text.trim();
    String password = passwordController.text.trim();

     String phoneName = "";
    String systemVersion ="";
    String systemName ="";
    String model ="";
    String localizedModel ="";
    String deviceId="";
    String apiKey = await LocalSource.getInfo(key: "FBSToken");

    if(Platform.isAndroid){
     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
     deviceId = await PlatformDeviceId.getDeviceId??"";
     phoneName = androidInfo.model;
     model = androidInfo.brand;
     systemVersion = androidInfo.version.release;
     localizedModel = androidInfo.brand;
     systemName = "Android";

     }else if(Platform.isIOS){
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      phoneName= iosInfo.name??"";
      systemVersion = iosInfo.systemVersion??"";
      systemName = iosInfo.systemName??"";
      model = iosInfo.model??"";
      localizedModel = iosInfo.localizedModel??"";
      deviceId = iosInfo.identifierForVendor??"";
    }


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
          bool check = await RegistrationServices().login(LoginSend(
            username: login, 
            password: password,
            phoneName: phoneName,
            systemVersion: systemVersion,
            apiKey: apiKey,
            model: model,
            localizedModel: localizedModel,
            systemName: systemName,
            deviceId: deviceId
            ).toJson());
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