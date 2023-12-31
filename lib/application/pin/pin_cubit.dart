// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sahopay/application/pin/pin_state.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/infrastructure/helper/local_auth.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:vibration/vibration.dart';

class PinCubit extends Cubit<PinState>{
  PinCubit(int type) : super( PinInitial()){
    init(type);
  }
  
  String text = "";
  bool clearCheck =false;
  bool errorBorder=false;
  bool loading =false;

  bool newPass = false;
  bool confirmPass = false;

  int screenType =0;

  String title = tr("pin.enterPass");
  String newPassword ="";
  String currentPassword ="";

  final LocalAuthentication auth = LocalAuthentication();

    
    void init(int type)async{
        if(type==1){
           final authenticate = await LocalAuth.authenticate();
           if(authenticate){
            emit(PinNextHome());
           }
        }
      screenType = type;
      currentPassword = await LocalSource.getInfo(key: "passCode");
      emit(PinInitial());
    }

  void writeText(String letter)async{
    if(text.length<4){
      if(letter=="-"){
      errorBorder=false;
      if(clearCheck){
      
      text=text.substring(0,text.length-1);
       if(text.isEmpty){
      }
      }else{
        if(screenType==1){
          final authenticate = await LocalAuth.authenticate();
          if(authenticate){
            emit(PinNextHome());
           }
        }
      }
    }
    
    else{
      clearCheck=true;
      errorBorder=false;
      if(text.length<4){

      if(text.isEmpty){
      text=letter;
    }else{
      text+=letter;
    }
    }
    if(text.length==4){
      emit(PinInitial());
       await Future.delayed(const Duration(milliseconds: 100));
      switch (screenType) {
        case 1:nextPage(); break;
        case 2:setPassword(); break;
        case 3:createPassword(); break;
      }
    }
    
  }
  emit(PinInitial());
    }
  }


  void createPassword()async{
     if(confirmPass){
      
     if(newPassword==text){
      await LocalSource.putInfo(key: "passCode", json: newPassword);
         EasyLoading.showSuccess(tr("pin.saved"));
        emit(PinNextHome());
     }else{
      error();
     }


     }else{
      newPassword = text;
      text="";
      title = tr("pin.confirmPass");
      confirmPass=true;
     }
     emit(PinInitial());
  }

  
  
  void setPassword()async{
     if(newPass){
   
      if(confirmPass){
       
      if(newPassword==text){
         await LocalSource.putInfo(key: "passCode", json: newPassword);
         EasyLoading.showSuccess(tr("pin.saved"));
          emit(PinClose());
      }else{
        error();
      }
      }else{
      newPassword=text;
      text='';
      title = tr("pin.confirmPass");
      confirmPass=true;
      }

     }else{
       if(text==currentPassword){
       title = tr("pin.enterNewPass");
      text="";
      newPass=true;
      }else{
      error();
    }
     }
    emit(PinInitial());
  }
  
  
  
  
  void nextPage()async{
    if(text==currentPassword){
    errorBorder=false;
    String json = await  LocalSource.getInfo(key: "loginParam");
    if(json.isNotEmpty){
      loading =true;
      emit(PinInitial());
      Map<String,dynamic> param = jsonDecode(json);
     await RegistrationServices().login(param);
       }
        emit(PinNextHome());
      }else{
    error();
    }
    loading =false;
    emit(PinInitial());
  }


  void error()async{
    Vibration.vibrate(duration: 500);
    for (int i = 0; i < 4; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      errorBorder = false;
      emit(PinInitial());
      await Future.delayed(const Duration(milliseconds: 100));
      errorBorder = true;
      emit(PinInitial());
      }
      text="";
  }
}