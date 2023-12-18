import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/history/history_state.dart';
import 'package:sahopay/domain/provider/history.dart';
import 'package:sahopay/infrastructure/models/history/history_item.dart';

class HistoryCubit extends Cubit<HistoryState>{
  HistoryCubit():super(HistoryInitial()){
    init();
  }

  List<HistoryItem> items = [];



  void init()async{

    items = await HistoryServices().init();
    emit(HistoryInitial());
  }



  void succesFilter(Map<String,dynamic> item){
    print(item);
  }
}