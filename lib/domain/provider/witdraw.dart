import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
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
}