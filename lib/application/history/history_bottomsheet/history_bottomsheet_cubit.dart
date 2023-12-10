import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/history/history_bottomsheet/history_bottomsheet_state.dart';

class HistoryBottomsheetCubit extends Cubit<HistoryBottomsheetState>{
  HistoryBottomsheetCubit():super(HistoryBottomsheetInitial());

  int changed=0;
  int changetype=0;

  void chooseChangeg(int index){
    changed =index;
    emit(HistoryBottomsheetInitial());
  }

  void chooseType(int index){
    changetype=index;
    emit(HistoryBottomsheetInitial());
  }
}