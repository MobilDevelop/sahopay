// import 'package:dio/dio.dart';
// import 'package:sahopay/domain/common/constants.dart';
// import 'package:sahopay/domain/my_dio/my_dio.dart';
// import 'package:sahopay/infrastructure/models/profile/profile.dart';

// class ProfileService{
//   final Dio dio = Mydio().dio();

//  Future <ProfileModel>  getWallet()async{
//   try {
//     Response response = await dio.get(AppContatants.transferWallet);

//     return Future.value(ProfileModel.(response.data["objectData"]));
//   } catch (e) {
//     return Future.value();
//   }
//  } 
// }