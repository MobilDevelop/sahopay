import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/universal/payment.dart';
import 'package:sahopay/infrastructure/models/deposit/wallet.dart';

class DepositService{
  final Dio dio = Mydio().dio();

 Future<List<Wallet>>  getWallet()async{
  try {
    Response response = await dio.get(AppContatants.depositAllWallet);

    return Future.value(walletItemFromMap(response.data['objectData']));
  } catch (e) {
    return Future.value([]);
  }
 } 

 Future<List<Payment>>  getPayment()async{
  try {
    Response response = await dio.get(AppContatants.depositAllPayment);

    return Future.value(paymentItemsFromMap(response.data));
  } catch (e) {
    return Future.value([]);
  }
 } 
}