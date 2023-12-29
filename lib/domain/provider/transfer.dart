import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/transfer/calc_response.dart';
import 'package:sahopay/infrastructure/models/transfer/payment.dart';
import 'package:sahopay/infrastructure/models/transfer/transfer_response.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';


class TransferService{
  final Dio dio = Mydio().dio();


 Future<List<TransferPayment>>  getPayment()async{
  try {
    Response response = await dio.get(AppContatants.transferPayment);

    return Future.value(transferItemsFromMap(response.data));
  } catch (e) {
    return Future.value([]);
  }
 } 

 Future<List<WalletObject>>  getWallet()async{
  try {
    Response response = await dio.get(AppContatants.transferWallet);

    return Future.value(walletItemFromMap(response.data["objectData"]));
  } catch (e) {
    return Future.value([]);
  }
 }

 Future<CalcResponse> getCalcInfo(Map<String,dynamic> param)async{
  try {
    Response response = await dio.post(AppContatants.transferCalc,data: param);
     return Future.value(CalcResponse.fromJson(response.data['objectData']));
  } catch (e) {
    return Future.value(CalcResponse(comissionAmount: "", comission: "", currency: ""));
  } 
 }

 Future<TransferResponse> transferSend(Map<String,dynamic> param)async{
  try {
    Response response = await dio.post(AppContatants.transferPost,data: param);

    return Future.value(TransferResponse.fromJson(response.data));
  } catch (e) {
     return Future.value(TransferResponse(code: -1, message:e.toString(), transId: -1, transDate: "", pc:"", amount:-1, sender: "", recipient: "", senderCurrency: "", recipientCurrency: ""));
  }
 }

}