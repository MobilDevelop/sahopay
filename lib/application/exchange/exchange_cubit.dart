import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/application/exchange/exchange_state.dart';
import 'package:sahopay/domain/provider/exchange.dart';
import 'package:sahopay/infrastructure/models/exchange/calculator_value.dart';
import 'package:sahopay/infrastructure/models/exchange/currency.dart';
import 'package:sahopay/infrastructure/models/exchange/exchange_rates.dart';
import 'package:sahopay/infrastructure/models/exchange/exchange_response.dart';
import 'package:sahopay/infrastructure/models/exchange/post.dart';
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
    loading=true;
    emit(ExchangeInitial());
    String amount = amountController.text.trim();
    String comment = commentController.text.trim();
    if(!senderBorderColor && !recieverBorderColor && amount.isNotEmpty){
      ExchangeResponse info =  await ExchangeService().sendInfo(ExchangePost(
      currencyKey: "${selectedSenderItem!.currencyName}2${selectedRecieverItem!.currencyName}", 
      senderAmount: amount, 
      comment: comment).toJson());
      if(info.code==200){
        emit(ExchangeDialog(info));
      }else{
        EasyLoading.showInfo(info.message);
      }
    }else{
      emit(ExchangeMessage(tr('universal.fillInfo')));
    }
    loading=false;
    emit(ExchangeInitial());
  }

  void setCalculator()async{
    String amount = amountController.text.trim();
    if(amount.length>2 ){
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
     if(selectedRecieverItem!=null){
       amountController.text= selectedSenderItem!.balance.toString();
      setCalculator();
     }
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

  void exchange(){
    if(selectedSenderItem==null || selectedSenderItem==selectedRecieverItem){
      senderBorderColor=true;
    }else{
      senderBorderColor=false;
    }
    if(selectedRecieverItem==null || selectedSenderItem==selectedRecieverItem){
      recieverBorderColor=true;
    }else{
      recieverBorderColor=false;
    }

    if(!senderBorderColor && !recieverBorderColor){
      WalletObject newWallet = selectedSenderItem!;
      selectedSenderItem=selectedRecieverItem;
      selectedRecieverItem=newWallet;

    }
    emit(ExchangeInitial());
  }

  Future listRefresh()async{
    selectedSenderItem=null;
    selectedRecieverItem=null;
    senderBorderColor=false;
    recieverBorderColor=false;
    amountController.clear();
    loading=true;
    emit(ExchangeInitial());
    init();
  }
}