// ignore_for_file: deprecated_member_use

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:sahopay/application/registration/registration_state.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';
import 'package:sahopay/infrastructure/models/login/captcha.dart';
import 'package:sahopay/infrastructure/models/login/registration_send_info.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';
import 'package:sahopay/presentation/pages/login/components/captcha_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class RegistrationCubit extends Cubit<RegistrationState>{

  RegistrationCubit() : super(RegistrationInitial());


  bool borderEmail =false;
  bool borderPassword =false;
  bool borderConfirm =false;
  bool borderCheck =false;
  bool passwordVisible = true;
  bool confirmpasswordVisible = true;
  bool checked = false;
  bool loading =false;

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  final loginController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final referalController=TextEditingController();
  final captchaController=TextEditingController();
  final succesCodeController=TextEditingController();



 void checkRegistration(context)async{
      loading=true;
      emit(RegistrationInitial());

    String email = loginController.text.trim();
    String password = passwordController.text.trim();
    String confirm = confirmPasswordController.text.trim();

    if(email.isEmpty || password.isEmpty || confirm.isEmpty){
       loading=false;
       EasyLoading.showInfo(tr("universal.fillInfo"));
    }else{
       if(Helper.isEmail(email)){
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
         captchaController.clear();
         showDialog(context: context, builder: (context) => CaptchaWidget(
         controller: captchaController, press:(GetCaptcha captcha){
          Navigator.pop(context);
          loading =true;
          emit(RegistrationInitial());
          registration(captcha);
         }));
         }
      }
      loading=false;
      emit(RegistrationInitial());

 }




 void registration(GetCaptcha captcha)async{
    
    String email = loginController.text.trim();
    String password = passwordController.text.trim();
    String referalCode = referalController.text.trim();
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
      systemVersion = iosInfo.systemVersion??'';
      systemName = iosInfo.systemName??"";
      model = iosInfo.model??"";
      localizedModel = iosInfo.localizedModel??"";
      deviceId = iosInfo.identifierForVendor??"";
    }

    Map<String,dynamic> sendInfo = RegistrationSendInfo(
    answer: captchaController.text.trim(), 
    email: email, 
    password:password, 
    referalCode: referalCode, 
    termsAndCantion: checked,
    localizedModel: localizedModel,
    model: model,
    systemName: systemName, 
    apiKey: apiKey,
    phoneName: phoneName,
    deviceId: deviceId,
    systemVersion: systemVersion,
    captchaRandomId: captcha.randomId).toJson();

    ServerMessage getInfo = await RegistrationServices().registration(sendInfo);
      loading=false;
    if(getInfo.code==200){
        emit(RegistrationSucces({
          "email":email,
          "password":password,
          "referal":referalCode,
          "check":checked
        }));
          }
    EasyLoading.showInfo(getInfo.message);                  
    emit(RegistrationInitial());
  }



  void visiblePassword(int type){
    if(type==1){
      passwordVisible=!passwordVisible;
    }else{
      confirmpasswordVisible=!confirmpasswordVisible;
    }
    emit(RegistrationInitial());
  }

void checkView(){
   
    emit(RegistrationNextLogin());
  }

showChecked(bool? value){
    checked=!checked;
    emit(RegistrationInitial());
  }



void launchURL() async =>await canLaunch("https://sahopay.com/terms-condition") ? 
await launch("https://sahopay.com/terms-condition") : throw 'Could not launch https://sahopay.com/terms-condition';

}