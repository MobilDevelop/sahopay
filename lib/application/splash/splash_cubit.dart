import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/application/splash/splash_state.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';
import 'dart:io' show Platform;

class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(SplashInitial()){
    init();
    }   
    bool loading = false;
  void init()async{
      Future.delayed(const Duration(seconds: 4),()async{
        String token = await LocalSource.getInfo(key: 'checkTokenAuth');
        String currentPassword = await LocalSource.getInfo(key: "passCode");
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        if(token.isEmpty){
          if(Platform.isAndroid){
     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
     EasyLoading.showInfo(androidInfo.toString());
    }else if(Platform.isIOS){
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    }
         emit(SplashNextLogin());
        }else {
          if(currentPassword.length<4){
          
        

            emit(SplashNextHome());
          }else{
            emit(SplashNextPin()); 
          } 
        }     
      });
  }
}