import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/exchange/exchange_rates.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';

class ExchangeService{
   final Dio dio = Mydio().dio();


  Future<List<WalletObject>> init()async{
  try {
    Response response = await dio.get(AppContatants.exchangeWallet);

    return Future.value(walletItemFromMap(response.data['objectData']));
  } catch (e) {
    return Future.value([]);
    }
  }

  Future<List<ExchangeRates>> exchangeRates()async{
  try {
    Response response = await dio.get(AppContatants.exchangeRates);

    return Future.value(exchangeRateFromMap(response.data));
  } catch (e) {
    return Future.value([]);
    }
  }

}