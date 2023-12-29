import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/history/history_state.dart';
import 'package:sahopay/domain/provider/history.dart';
import 'package:sahopay/infrastructure/models/history/get_exchange.dart.dart';
import 'package:sahopay/infrastructure/models/history/get_referals.dart';
import 'package:sahopay/infrastructure/models/history/get_transactions.dart';

class HistoryCubit extends Cubit<HistoryState>{
  HistoryCubit():super(HistoryInitial()){
    init();
  }
  
  bool loading = false;
  bool saveAll =false;

  int page = 0;
  int filterType=0;
  int changetype=0;
  int screenType=1;

  String sendType =""; 

  List<HistoryTransaction> transactionItems = [];
  List<HistoryExchange> exchangeItems = [];
  List<HistoryReferals> referalsItems = [];



  void init()async{
   if(!loading){
    loading =true;
    emit(HistoryInitial());
     switch (screenType) {
       case 1:getTransactions(); break;
       case 2:getExchanges(); break;
       case 3:getReferals(); break;
     }
   }
   
  }


  void getTransactions()async{
    Map<String,dynamic> param = {
      "page":page,
      "size":15,
      "param":sendType};
    if(!saveAll){ 
    List<HistoryTransaction> newData = await HistoryServices().getTransactions(param);
    if(newData.isNotEmpty){
     transactionItems.addAll(newData);
     newData.clear();
     page++;
    }else{
      saveAll=true;
    }
    }
    loading =false;
   emit(HistoryInitial());
  }

  void getExchanges()async{
    Map<String,dynamic> param = {
      "page":page,
      "size":15};
    if(!saveAll){ 
    List<HistoryExchange> newData = await HistoryServices().getExchanges(param);
    if(newData.isNotEmpty){
     exchangeItems.addAll(newData);
     newData.clear();
     page++;
    }else{
      saveAll=true;
    }
    }
    loading =false;
   emit(HistoryInitial());
  }


  void getReferals()async{
     Map<String,dynamic> param = {
      "page":page,
      "size":15};
    if(!saveAll){ 
    List<HistoryReferals> newData = await HistoryServices().getReferals(param);
    if(newData.isNotEmpty){
     referalsItems.addAll(newData);
     newData.clear();
     page++;
    }else{
      saveAll=true;
    }
    }
    loading =false;
   emit(HistoryInitial());

    
  }

  Future listRefresh()async{
     page=0;
     saveAll=false;
     transactionItems.clear();
     exchangeItems.clear();
     referalsItems.clear();
    init();
  }

  void succesFilter(int type){
    page=0;
    filterType =type;
    saveAll =false;
    transactionItems.clear();
    exchangeItems.clear();
    referalsItems.clear();
    switch (type) {
      case 0: screenType=1; break;
      case 1: screenType=2; break;
      case 2: screenType=3; break;
    }
    init();
  }

   void chooseType(int index){
    changetype=index;
    switch (index) {
      case 0: sendType=""; break;
      case 1: sendType="USD"; break;
      case 2: sendType="EUR"; break;
      case 3: sendType="RUB"; break;
      case 4: sendType="USDT"; break;
      case 5: sendType="UZST"; break;
      case 6: sendType="SPY"; break;
    }
    page = 0;
    saveAll=false;
    transactionItems.clear();
    init();
  }
}