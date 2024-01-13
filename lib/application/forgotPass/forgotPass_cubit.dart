import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:sahopay/application/forgotPass/forgotPass_state.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/firebase_options.dart';
import 'package:sahopay/infrastructure/models/login/captcha.dart';
import 'package:sahopay/infrastructure/models/login/registration_send_info.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';
import 'package:sahopay/presentation/pages/login/components/captcha_widget.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'dart:io' show Platform;

class ForgotPassCubit extends Cubit<ForgotPassState>{

ForgotPassCubit() : super(ForgotPassInitial());

final succesCodeController = TextEditingController();
final captchaController = TextEditingController();

final timerController = CountdownController(autoStart: true);

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

bool loading = false;
bool showResend =false;


void succesCode()async{
    loading =true;
    String code = succesCodeController.text.trim();
    emit(ForgotPassInitial());
    if(code.length<6){
      EasyLoading.showInfo(tr("pin.character"));
    }else{
      ServerMessage info = await RegistrationServices().emeailCodeSucces(code);
      if(info.code==200){
        emit(ForgotPassNextLogin());
      }
      EasyLoading.showInfo(info.message);
    }
    loading =false;
    emit(ForgotPassInitial());
}


 void resendCode(context,Map<String,dynamic> param)async{
    
     String phoneName = "";
    String systemVersion ="";
    String systemName ="";
    String model ="";
    String localizedModel ="";
    String deviceId = "";

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

    if(showResend){
       captchaController.clear();
         showDialog(context: context, builder: (context) => CaptchaWidget(
      controller: captchaController, 
      press:(GetCaptcha captcha)async{
          Navigator.pop(context);
    Map<String,dynamic> sendInfo = RegistrationSendInfo(
    answer: captchaController.text.trim(), 
    email: param['email'], 
    password:param['password'], 
    referalCode: param['referal'], 
    termsAndCantion: param['check'],
    apiKey: DefaultFirebaseOptions.currentPlatform.apiKey,
    phoneName: phoneName,
    systemVersion: systemVersion,
    localizedModel: localizedModel,
    model: model,
    systemName: systemName,
    deviceId: deviceId,
    captchaRandomId: captcha.randomId).toJson();

    ServerMessage getInfo = await RegistrationServices().registration(sendInfo);
     
     if(getInfo.code==200){
      showResend=false;
      timerController.restart();
     }
     EasyLoading.showInfo(getInfo.message);

    }));
      }
  }
  
  
  void resendCodeShow(){
    showResend=true;
    emit(ForgotPassInitial());
  }
}