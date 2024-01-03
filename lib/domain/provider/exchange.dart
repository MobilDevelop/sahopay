import 'package:dio/dio.dart';
import 'package:sahopay/domain/common/constants.dart';
import 'package:sahopay/domain/my_dio/my_dio.dart';
import 'package:sahopay/infrastructure/models/exchange/calculator_value.dart';
import 'package:sahopay/infrastructure/models/exchange/exchange_rates.dart';
import 'package:sahopay/infrastructure/models/exchange/exchange_response.dart';
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

  Future<CalculatorValue> calculator(Map<String,dynamic> param)async{
    try {
      Response response =await dio.post(AppContatants.exchangeCalc,data: param);
      return Future.value(CalculatorValue.fromJson(response.data['objectData']));
    } catch (e) {
      return Future.value(CalculatorValue(calAmount: "", senderCurrensy: "", recipientCurrensy: "", rate: ""));
    }
  }

  Future<ExchangeResponse> sendInfo(Map<String,dynamic> param)async{
    try {
      Response response = await dio.post(AppContatants.exchangePost,data: param);
      if(response.data['code']==200){
        return Future.value(ExchangeResponse.fromJson(response.data));
      }else{
        return Future.value(
          ExchangeResponse(transId: -1, 
          message: response.data['message'], 
          code: response.data['code'], 
          transDate: "", pc: "",
          amount: -1, 
          conversionAmount: -1, 
          sender: "", 
          recipient: "", 
          senderCurrency: "", 
          recipientCurrency: "", rate:-1)
        );
      }
    } catch (e) {
      return Future.value(ExchangeResponse(
        transId: -1, 
        message: "server error", 
        code: -1, 
        transDate: "",
        pc: "", 
        amount: -1, 
        conversionAmount: -1, 
        sender: "", 
        recipient: "", 
        senderCurrency: "", 
        recipientCurrency: "", 
        rate: -1));
    }

  }

}