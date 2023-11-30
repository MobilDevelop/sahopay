import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/transfer/transfer_state.dart';

class TransferCubit extends Cubit<TransferState>{
  TransferCubit():super(TransferInitial());
}