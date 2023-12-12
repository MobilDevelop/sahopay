import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/splash/splash_state.dart';
class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(SplashInitial()){
    init();
    }   
    bool loading = false;
  void init()async{
      Future.delayed(const Duration(seconds: 4),()async{
        emit(SplashNextLogin());
      });
  }


 
}