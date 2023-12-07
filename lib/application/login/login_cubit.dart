import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/login/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(LoginInitial());
  
  bool loading =false;
  bool chooseView = true;

  final loginController=TextEditingController();
  final passwordController=TextEditingController();


  void checkInfo()async{}

  void checkView(){
    chooseView = !chooseView;
    emit(LoginInitial());
  }
}