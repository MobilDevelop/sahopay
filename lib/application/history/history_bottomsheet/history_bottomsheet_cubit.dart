import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/history/history_bottomsheet/history_bottomsheet_state.dart';

class HistoryBottomsheetCubit extends Cubit<HistoryBottomsheetState>{
  HistoryBottomsheetCubit(int type):super(HistoryBottomsheetInitial()){
    init(type);
  }

  int changed=0;

  
 void init(int type){
   changed =type;
   emit(HistoryBottomsheetInitial());
 }

  void chooseChangeg(int index){
    changed =index;
    emit(HistoryBottomsheetInitial());
  }

 
}