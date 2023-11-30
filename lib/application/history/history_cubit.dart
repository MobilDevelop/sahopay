import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/history/history_state.dart';

class HistoryCubit extends Cubit<HistoryState>{
  HistoryCubit():super(HistoryInitial());
}