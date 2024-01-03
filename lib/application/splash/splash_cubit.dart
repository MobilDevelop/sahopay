import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/splash/splash_state.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';
class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(SplashInitial()){
    init();
    }   
    bool loading = false;
  void init()async{
      Future.delayed(const Duration(seconds: 4),()async{
        String token = await LocalSource.getInfo(key: 'checkTokenAuth');
        String currentPassword = await LocalSource.getInfo(key: "passCode");
        if(token.isEmpty){
         emit(SplashNextLogin());
        }else {
          if(currentPassword.length<4){
            emit(SplashNextHome());
          }else{
            emit(SplashNextPin());
          }
          
        }
        
      });
  }


 
}