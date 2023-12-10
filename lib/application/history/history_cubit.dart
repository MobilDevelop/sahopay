import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/history/history_state.dart';

class HistoryCubit extends Cubit<HistoryState>{
  HistoryCubit():super(HistoryInitial());

  void succesFilter(Map<String,dynamic> item){
    print(item);
  }
}