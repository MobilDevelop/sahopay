import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/dashboard/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState>{
  DashboardCubit():super(DashboardInitial());
}