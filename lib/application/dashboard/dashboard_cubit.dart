import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/dashboard/dashboard_state.dart';
import 'package:sahopay/domain/provider/dashboard.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';

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
}
