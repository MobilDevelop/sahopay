import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/application/home/home_state.dart';
import 'package:sahopay/presentation/pages/dashboard/dashboard.dart';
import 'package:sahopay/presentation/pages/deposit/deposit_page.dart';
import 'package:sahopay/presentation/pages/exchange/exchange_page.dart';
import 'package:sahopay/presentation/pages/history/history_page.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitial()){
    nextScreen(0);
  }

  int currentPage = 0;
  dynamic currentBackPressTime;

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  Widget? window;
   

  void nextScreen(int index)async{
    switch (index) {
      case 0:window= Dashboard(press:openDrawer);break;
      case 1:window=const DepositPage();break;
      case 2:window=const ExchangePage();break;
      case 3:window=const HistoryPage();break;
    }
    currentPage =index;
    emit(HomeInitial());
  }
  void openDrawer(){
   scaffoldkey.currentState!.openDrawer();
  }

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      EasyLoading.showToast('Dasturdan chiqish uchun yana bir marta bosing!');
      return Future.value(false);
    }
    return Future.value(true);
  }
  
}
