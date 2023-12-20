import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/password/password_state.dart';
import 'package:sahopay/domain/provider/password.dart';
import 'package:sahopay/infrastructure/models/password/password.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';

class PasswordCubit extends Cubit<PasswordState>{
  PasswordCubit():super(PasswordInitial());

  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  bool loading = false;

  bool passwordVisible = true;
  bool newPasswordVisible = true;
  bool confirmPasswordVisible = true;

  bool passwordBorder = false;
  bool newPasswordBorder = false;
  bool confirmPasswordBorder = false;
  

  void visiblePassword(int type){
    switch (type) {
      case 1: passwordVisible=!passwordVisible; break;
      case 2: newPasswordVisible=!newPasswordVisible; break;
      case 3: confirmPasswordVisible=!confirmPasswordVisible; break;
    }
    emit(PasswordInitial());
  }
  void updatePassword() async {
    loading = true;
    emit(PasswordInitial());
    String currentPass = currentPassController.text.trim();
    String newPass = newPassController.text.trim();
    String confirmPass = confirmPassController.text.trim();

    if (currentPass.length<4 ){
      passwordBorder = true;
    }else{
      passwordBorder = false;
    }
    
    if (newPass.length<4 ){
      newPasswordBorder = true;
    }else{
      newPasswordBorder = false;
    }

    if (confirmPass != newPass ){
      confirmPasswordBorder = true;
    }else{
      confirmPasswordBorder = false;
    }

    if (!passwordBorder && !newPasswordBorder && !confirmPasswordBorder){
      ServerMessage response = await PasswordService().setPassword(UpdatePassword(currentPassword: currentPass, 
      newPassword: newPass, confirmPassword: confirmPass).toJson());
      if(response.code==200){
        emit(PasswordMessage(response.message));
      }
    }
    loading = false;
    emit(PasswordInitial());
  }
  
  void clearText (){
    currentPassController.clear();
    newPassController.clear();
    confirmPassController.clear();
    emit(PasswordInitial());
  }

}