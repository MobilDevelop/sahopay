import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sahopay/application/home/home_state.dart';
import 'package:sahopay/presentation/pages/dashboard/dashboard.dart';
import 'package:sahopay/presentation/pages/deposit/deposit_page.dart';
import 'package:sahopay/presentation/pages/exchange/exchange_page.dart';
import 'package:sahopay/presentation/pages/history/history_page.dart';
import 'package:sahopay/presentation/pages/setting/setting_page.dart';
import 'package:sahopay/presentation/pages/transfer/transfer_page.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(HomeInitial());

  int currentPage = 0;

  List<Widget> screens = [
    const Dashboard(),
    const DepositPage(),
    const TransferPage(),
    const ExchangePage(),
    const HistoryPage(),
    const SettingPage(),
  ];

  void nextScreen(int index){
    currentPage =index;
    emit(HomeInitial());
  }
  void openDrawer(){
    emit(HomeOpenDrawer());
  }
}
