// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sahopay/application/dashboard/dashboard_state.dart';
import 'package:sahopay/domain/provider/dashboard.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardCubit extends Cubit<DashboardState>{
  DashboardCubit():super(DashboardInitial()){
    init();
  }

  bool loading =true;

  List<DashboardModel> items = [];

  void init()async{
    items = await DashboardServices().init();
    loading=false;
    emit(DashboardInitial());
  }

  void nextScreen(int index,DashboardModel model){
    if(index==1){
      emit(DashboardNextTransfer(model));
    }else if(index==3){
      emit(DashboardNextWithDraw(model));
    }else if(index==2){
      emit(DashboardNextDeposit(model));
    }
  }

  Future listRefresh()async{
    loading=true;
    emit(DashboardInitial());
    init();
  }
  void copyText(String text)async{
    await Clipboard.setData(ClipboardData(text:text));
   EasyLoading.showSuccess("Success");
  }
  void launchURL() async =>await canLaunch("https://t.me/sahopaybot") ? await launch("https://t.me/sahopaybot") : throw 'Could not launch https://t.me/sahopaybot';
}
