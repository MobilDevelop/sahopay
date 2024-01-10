import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/application/home/home_state.dart';
import 'package:sahopay/domain/provider/drawer.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/infrastructure/models/profile/profile.dart';
import 'package:sahopay/presentation/pages/dashboard/dashboard.dart';
import 'package:sahopay/presentation/pages/deposit/deposit_page.dart';
import 'package:sahopay/presentation/pages/exchange/exchange_page.dart';
import 'package:sahopay/presentation/pages/history/history_page.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitial()){
    getinfo();
    nextScreen(0);
  }

  int currentPage = 0;
  dynamic currentBackPressTime;
  ProfileModel profileInfo =ProfileModel(firstName: "", lastName: "", email: "", clientId: "");

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  Widget? window;
  


  void nextScreen(int index)async{
   switch (index) {
      case 0:window= Dashboard(press:openDrawer, nextDeposit:next);break;
      case 1:window= const DepositPage();break;
      case 2:window=const ExchangePage();break;
      case 3:window=const HistoryPage();break;
    }
    currentPage =index;
    emit(HomeInitial());
  }
  void openDrawer(){
   scaffoldkey.currentState!.openDrawer();
  }

  void next(DashboardModel model){
    currentPage=1;
    window= DepositPage(model: model);
    emit(HomeInitial());
  }

  void getinfo()async{
     profileInfo =  await  DrawerService().getProfile();
     emit(HomeInitial());
  }

  Future<bool> onWillPop() async {
   if(currentPage==0){
     DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      EasyLoading.showToast(tr("home.exit"));
      return Future.value(false);
    }
    return Future.value(true);
   }else{
    currentPage=0;
    nextScreen(0);
    return Future.value(false);
   }
  }

  void checkTime()async{
    
  }
  
}
