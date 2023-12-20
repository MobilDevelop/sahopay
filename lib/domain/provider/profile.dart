import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/profile/profile.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';

class ProfileService{
  final Dio dio = Mydio().dio();

 Future <ProfileModel> getProfile()async{
  try {
    Response response = await dio.get(AppContatants.profile);

    return Future.value((ProfileModel.fromJson(response.data)));
  } catch (e) {
    return Future.value(ProfileModel(firstName: "", lastName: "", email: "", clientId: ""));
  }
 } 

 Future<ServerMessage> setProfile(Map<String,dynamic> param)async{
  try {
    Response response = await dio.post(AppContatants.profileUpdate,data: param);

    return Future.value(ServerMessage.fromJson(response.data));
  } catch (e) {
    return Future.value(ServerMessage(message: "error", code: -1));
  }
 }
}