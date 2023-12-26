import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/profile/profile.dart';

class DrawerService{
  final Dio dio = Mydio().dio();

 Future <ProfileModel> getProfile()async{
  try {
    Response response = await dio.get(AppContatants.profile);

    return Future.value((ProfileModel.fromJson(response.data)));
  } catch (e) {
    return Future.value(ProfileModel(firstName: "", lastName: "", email: "", clientId: ""));
  }
 } 

}