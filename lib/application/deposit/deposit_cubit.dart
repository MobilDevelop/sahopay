import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/deposit/deposit_state.dart';

class DepositCubit extends Cubit<DepositState>{
  DepositCubit():super(DepositInitial());
}