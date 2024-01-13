import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/application/splash/splash_state.dart';
import 'package:sahopay/infrastructure/helper/firebase_api.dart';
import 'package:sahopay/infrastructure/local_source/local_source.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit():super(SplashInitial()){
    init();
    }   
    bool loading = false;
     FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  void init()async{
      Future.delayed(const Duration(seconds: 4),()async{
        String token = await LocalSource.getInfo(key: 'checkTokenAuth');
        String currentPassword = await LocalSource.getInfo(key: "passCode");
        if(token.isEmpty){
         emit(SplashNextLogin());
        }else {
          if(currentPassword.length<5){
            emit(SplashNextHome());
          }else{
            emit(SplashNextPin()); 
          } 
        }     
      });
     
     firebaseMessaging.getToken().then((token)async{
     await LocalSource.putInfo(key:  "FBSToken", json: token??"");
  });
   await firebaseMessaging.requestPermission(
    alert: true,
    announcement:false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true
  ); 
  loadingFCM();
  }

  Future<void> loadingFCM() async {
    final firebaseMessaging = FirebaseApi();
    firebaseMessaging.setNotifications();
    firebaseMessaging.streamCtrl.stream.listen((event) {
      EasyLoading.showInfo(event);
    },);

    firebaseMessaging.titleCtrl.stream.listen((event) {
      EasyLoading.showInfo(event);
    },);
    
    firebaseMessaging.bodyCtrl.stream.listen((event) {
      EasyLoading.showInfo(event);
    },);
  }
}