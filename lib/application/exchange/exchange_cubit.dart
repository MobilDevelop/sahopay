import 'package:flutter/material.dart';
import 'package:sahopay/application/exchange/exchange_state.dart';
import 'package:sahopay/domain/provider/exchange.dart';
import 'package:sahopay/infrastructure/models/exchange/calculator_value.dart';
import 'package:sahopay/infrastructure/models/exchange/currency.dart';
import 'package:sahopay/infrastructure/models/exchange/exchange_rates.dart';
import 'package:sahopay/infrastructure/models/exchange/post.dart';
import 'package:sahopay/infrastructure/models/universal/server_message.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class ExchangeCubit extends Cubit<ExchangeState>{
  ExchangeCubit():super(ExchangeInitial()){
    init();
  }

  bool loading=true;
  bool setCallValue =true;
  bool senderBorderColor = false;
  bool recieverBorderColor = false;
  bool senderItemEmpty = false;


  List<WalletObject> items = [];
  WalletObject? selectedSenderItem;
  WalletObject? selectedRecieverItem;

  List<ExchangeRates> ratesItems = [];

  CalculatorValue? calculatorValue;


  final amountController = TextEditingController();
  final commentController = TextEditingController();

  

  void init()async{
    items = await ExchangeService().init();
    ratesItems = await ExchangeService().exchangeRates();

    loading=false;
    emit(ExchangeInitial());
  }

  void buttonExchange()async{
    String amount = amountController.text.trim();
    String comment = commentController.text.trim();
    if(!senderBorderColor && !recieverBorderColor && amount.isNotEmpty){
      ServerMessage info =  await ExchangeService().sendInfo(ExchangePost(
      currencyKey: "${selectedSenderItem!.currencyName}2${selectedRecieverItem!.currencyName}", 
      senderAmount: amount, 
      comment: comment).toJson());
      emit(ExchangeMessage(info.message));
    }else{
      emit(ExchangeMessage(tr('universal.fillInfo')));
    }
  }

  void setCalculator()async{
    String amount = amountController.text.trim();
    if(amount.length>2){
      calculatorValue = await ExchangeService().calculator(ExchangeCall(currencyKey: "${selectedSenderItem!.currencyName}2${selectedRecieverItem!.currencyName}", 
      senderAmount: amount).toJson());
    }
    emit(ExchangeInitial());
  }

  void onSubmitted(String value){
    if(selectedRecieverItem!=null && selectedSenderItem!=null){
      setCalculator();
    }
  }

  void pressMagnet(){
    if(selectedSenderItem==null){
     senderItemEmpty =true;
     senderBorderColor=true;
    }else{
      senderItemEmpty=false;
      senderBorderColor=false;
      amountController.text= selectedSenderItem!.balance.toString();
      setCalculator();
    }
    emit(ExchangeInitial());
  }



  void selectedSender(WalletObject wallet){
    selectedSenderItem =wallet;
    if(selectedSenderItem==selectedRecieverItem){
      senderBorderColor=true;
      recieverBorderColor=true;
    }else{
      senderBorderColor=false;
      recieverBorderColor=false;
      senderItemEmpty=false;
      if(calculatorValue!=null){
        setCalculator();
      }
    }
     emit(ExchangeInitial());
  }

  void selectedReciever(WalletObject wallet){
    selectedRecieverItem =wallet;
    if(selectedSenderItem==selectedRecieverItem){
      senderBorderColor=true;
      recieverBorderColor=true;
    }else{
      senderBorderColor=false;
      recieverBorderColor=false;
      senderItemEmpty=false;
       if(calculatorValue!=null){
        setCalculator();
      }
    }
     emit(ExchangeInitial());
  }
}