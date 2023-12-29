import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/history/get_exchange.dart.dart';
import 'package:sahopay/infrastructure/models/history/get_referals.dart';
import 'package:sahopay/infrastructure/models/history/get_transactions.dart';

class HistoryServices{
 final Dio dio = Mydio().dio();

 Future<List<HistoryTransaction>> getTransactions(Map<String,dynamic> param)async{
  try {
    Response response = await dio.get(AppContatants.historyTransactions,queryParameters: param);
    return Future.value(historyTransactionFromMap(response.data['content']));
  } catch (e) {
    return Future.value([]);
  }
 }

 Future<List<HistoryExchange>> getExchanges(Map<String,dynamic> param)async{
  try {
    Response response = await dio.get(AppContatants.historyExchages,queryParameters: param);
    return Future.value(historyExchangeFromMap(response.data['content']));
  } catch (e) {
    return Future.value([]);
  }
 }

 Future<List<HistoryReferals>> getReferals(Map<String,dynamic> param)async{
  try {
    Response response = await dio.get(AppContatants.historyReferals,queryParameters: param);
    return Future.value(historyReferalsFromMap(response.data["content"]));
  } catch (e) {
    return Future.value([]);
  }
 }
}