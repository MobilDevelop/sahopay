import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/drawer/drawer_state.dart';
import 'package:sahopay/domain/provider/drawer.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';
import 'package:sahopay/infrastructure/models/profile/profile.dart';

class DrawerCubit extends Cubit<DrawerState>{
  DrawerCubit():super(DrawerInitial());
  
  
  void logOut()async{
    await LocalSource.clearProfile();
    emit(DrawerNextLogin());
  }

  

  

  void nextPage(int index){
    if(index==1){
      emit(DrawerNextTransfer());
    }else if(index==2){
      emit(DrawerNextWithdraw());
    }else if (index ==3){
      emit(DrawerNextSetting());
    }else{
      emit(DrawerNextPin());
    }
  }

   
}