import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/infrastructure/models/withdraw/payment.dart';

class WithdrawService{
  final Dio dio = Mydio().dio();


 Future<List<WithdrawPayment>> getPayment()async{
  try {
    Response response = await dio.get(AppContatants.withdrawPayment);
    return Future.value(withdrawPaymentFromMap(response.data["objectData"]));
  } catch (e) {
    return Future.value([]);
  }
 } 

 Future<List<WalletObject>>  getWallet()async{
  try {
    Response response = await dio.get(AppContatants.withdrawWallet);

    return Future.value(walletItemFromMap(response.data["objectData"]));
  } catch (e) {
    return Future.value([]);
  }
 }

 Future<String> calculate(Map<String,dynamic> param)async{
  try {
    Response response = await dio.post(AppContatants.withdrawCalc,data: param);
    return Future.value(response.data['objectData']['commissionAmount'].toString());
  } catch (e) {
     return Future.value("");
  }
 }

 Future<ServerMessage> sendInfo(Map<String,dynamic> param)async{
  try {
    Response response = await dio.post(AppContatants.withdrawPost,data: param);
    return Future.value(ServerMessage.fromJson(response.data));
  } catch (e) {
      return Future.value(ServerMessage(message: "error", code: -1));
  }
 }
}