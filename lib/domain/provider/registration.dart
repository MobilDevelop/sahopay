import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';
import 'package:sahopay/infrastructure/models/login/captcha.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';

class RegistrationServices{
   final Dio dio = Mydio().dio();

   Future<ServerMessage> registration(Map<String,dynamic> param)async{
    try {
       Response response = await dio.post(AppContatants.registration,data: param);
     return Future.value(ServerMessage.fromJson(response.data));
    } catch (e) {
      print(e);
      return Future.value(ServerMessage(message: "error",code: -1));
    }
  }

  Future<GetCaptcha> getCaptcha()async{
    try {
      Response response = await dio.get(AppContatants.captcha);
      
      return Future.value(GetCaptcha.fromJson(response.data));
    } catch (e) {
      return Future.value(GetCaptcha(photoUrl: "", randomId: ""));
    }
  }

  Future<ServerMessage> emeailCodeSucces(String code)async{
    try {
      Response response = await dio.post(AppContatants.succesCode,data: {"key":code});
      
      return Future.value(ServerMessage.fromJson(response.data));
    } catch (e) {
      return Future.value(ServerMessage(code: -1,message: "error"));
    }
  }

  Future<bool> login(Map<String,dynamic> param)async{
    try {
      Response response = await dio.post(AppContatants.login,data: param);
      LocalSource.putInfo(key: "token",json: "Bearer  ${response.data['id_token']}");
      return Future.value(true);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  Future<ServerMessage> forgotPass(Map<String,dynamic> param)async{
    try {
      Response response = await dio.post(AppContatants.forgotPassword,data: param);
    
    return Future.value(ServerMessage.fromJson(response.data));
    } catch (e) {
      return Future.value(ServerMessage(message: "error", code: -1));
    }
  }

  Future<ServerMessage> setPassword(Map<String,dynamic> param)async{
    try {
      Response response = await dio.post(AppContatants.newPassword,data: param);

      return Future.value(ServerMessage.fromJson(response.data));
    } catch (e) {
      return Future.value(ServerMessage(message: "error", code: -1));
    }
  }
}