import 'package:sahopay/infrastructure/models/login/captcha.dart';

abstract class LoginState{}

class LoginInitial extends LoginState{}

class LoginNextPin extends LoginState{}

class LoginError extends LoginState{
  String message;
  LoginError(this.message); 
}

class LoginCaptcha extends LoginState{
  GetCaptcha captcha;
  LoginCaptcha(this.captcha);
}