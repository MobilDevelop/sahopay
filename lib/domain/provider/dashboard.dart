import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';

class DashboardServices{
 final Dio dio = Mydio().dio();

 Future<List<DashboardModel>> init()async{
  try {
    Response response = await dio.get(AppContatants.dashboard);

    return Future.value(dashboardModelFromMap(response.data['objectData']));
  } catch (e) {
    return Future.value([]);
  }
 }
}