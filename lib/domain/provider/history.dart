import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/history/history_item.dart';

class HistoryServices{
 final Dio dio = Mydio().dio();

 Future<List<HistoryItem>> init(String url,String page,String size)async{
  try {
    Response response = await dio.get(AppContatants.history+url,queryParameters: {"page":page,"size":size});
    return Future.value(historyItemFromMap(response.data['content']));
  } catch (e) {
    return Future.value([]);
  }
 }
}