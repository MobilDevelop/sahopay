import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/setting/setting_state.dart';

class SettingCubit extends Cubit<SettingState>{
  SettingCubit():super(SettingInitial());
}