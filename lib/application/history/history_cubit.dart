import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/history/history_state.dart';
import 'package:sahopay/domain/provider/history.dart';
import 'package:sahopay/infrastructure/models/history/history_item.dart';

class HistoryCubit extends Cubit<HistoryState>{
  HistoryCubit():super(HistoryInitial()){
    init("");
  }
  
  bool loading = false;
  bool saveAll =false;

  int size =10;
  int page = 0;
  int filterType=0;
    int changetype=0;

  List<HistoryItem> items = [];



  void init(String url)async{
   if(!loading){
    loading =true;
    emit(HistoryInitial());
    if(!saveAll){ 
    List<HistoryItem> newData = await HistoryServices().init(url,page.toString(),size.toString());
    if(newData.isNotEmpty){
     items.addAll(newData);
     newData.clear();
     page++;
    }else{
      saveAll=true;
    }
    }
   }
   loading =false;
   emit(HistoryInitial());
  }



  void succesFilter(int type){
    page=0;
    filterType =type;
    saveAll =false;
    items.clear();
    switch (type) {
      case 0: init(""); break;
      case 1: init("-exchange"); break;
      case 2: init(""); break;
      default:
    }
  }

   void chooseType(int index){
    changetype=index;
    emit(HistoryInitial());
  }
}