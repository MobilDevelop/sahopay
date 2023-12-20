import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';

class PasswordService{
  final Dio dio = Mydio().dio();


 Future<ServerMessage> setPassword(Map<String,dynamic> param)async{
  try {
    Response response = await dio.post(AppContatants.passwordUpdate,data: param);

    return Future.value(ServerMessage.fromJson(response.data));
  } catch (e) {
    return Future.value(ServerMessage(message: "error", code: -1));
  }
 }
}