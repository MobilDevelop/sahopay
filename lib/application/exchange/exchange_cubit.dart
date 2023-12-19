import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/exchange/exchange_state.dart';
import 'package:sahopay/domain/provider/exchange.dart';
import 'package:sahopay/infrastructure/models/exchange/exchange_rates.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';

class ExchangeCubit extends Cubit<ExchangeState>{
  ExchangeCubit():super(ExchangeInitial()){
    init();
  }

  bool loading=true;


  List<WalletObject> items = [];
  WalletObject? selectedSenderItem;
  WalletObject? selectedRecieverItem;

  List<ExchangeRates> ratesItems = [];


  final amountController = TextEditingController();
  final commentController = TextEditingController();

  

  void init()async{
    items = await ExchangeService().init();
    ratesItems = await ExchangeService().exchangeRates();

    loading=false;
    emit(ExchangeInitial());
  }

  void buttonExchange(){
    
  }

  void selectedSender(WalletObject wallet){
    selectedSenderItem =wallet;
    emit(ExchangeInitial());
  }

  void selectedReciever(WalletObject wallet){
    selectedRecieverItem =wallet;
    emit(ExchangeInitial());
  }
}