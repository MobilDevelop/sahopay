import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/drawer/drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState>{
  DrawerCubit():super(DrawerInitial());
}