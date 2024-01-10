import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/setting/setting_state.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';

class SettingCubit extends Cubit<SettingState>{
  SettingCubit():super(SettingInitial()){
    init();
  }

  double value = 60;

  void init()async{
    String jsonTime = await LocalSource.getInfo(key: 'ScreenBlockTime');
    if(jsonTime.isNotEmpty){
      value = double.parse(jsonTime);
    }
    emit(SettingInitial());
  }

  void setValue(double val){
    value =val;
    emit(SettingInitial());
  }

  void saveTime(double time){
    LocalSource.putInfo(key: "ScreenBlockTime", json: time.toString());
  }
}