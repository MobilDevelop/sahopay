import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());
  
  bool loading =false;
  bool chooseView = false;
  bool passwordVisible = false;
  bool confirmpasswordVisible = false;
  bool checked = false;
  bool forgotPassword = false;

  final loginController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final referalController=TextEditingController();


  void checkInfo()async{
    String login = loginController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String referalCode = referalController.text.trim();

    if(chooseView){
      if(login.isEmpty || password.isEmpty || confirmPassword.isEmpty || referalCode.isEmpty){
      
    }
    }else{
      if(login.isEmpty || password.isEmpty){
      
    }
    }
    emit(LoginNextHome());
  }

  void checkView(){
    chooseView = !chooseView;
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