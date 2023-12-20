import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/transfer/payment.dart';
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
}