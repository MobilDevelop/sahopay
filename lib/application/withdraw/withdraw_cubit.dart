import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/withdraw/withdraw_state.dart';

class WithdrawCubit extends Cubit<WithDrawState>{
  WithdrawCubit():super(WithDrawInitial());
}