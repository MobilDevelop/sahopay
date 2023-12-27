import 'dart:convert';

import 'package:sahopay/application/pin/pin_state.dart';
import 'package:sahopay/domain/provider/registration.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:vibration/vibration.dart';

class PinCubit extends Cubit<PinState>{
  PinCubit() : super( PinInitial());
  
  String text = "";
  bool clearCheck =false;
  bool errorBorder=false;
  

  void writeText(String letter)async{
    if(letter=="-"){
      errorBorder=false;
      if(clearCheck){
      
      text=text.substring(0,text.length-1);
       if(text.isEmpty){
      }
      }else{
        print("finger");
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
     emit(PinInitial());
    }
    if(text.length==4){
      if(text=="1221"){
        errorBorder=false;
    
    String json = await  LocalSource.getInfo(key: "loginParam");
    if(json.isNotEmpty){
      Map<String,dynamic> param = jsonDecode(json);
     await RegistrationServices().login(param);

    }
        emit(PinNextHome());
      }else{
      
       
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
    emit(PinInitial());
  }
  }
}