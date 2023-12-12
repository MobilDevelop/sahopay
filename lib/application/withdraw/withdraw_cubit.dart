import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/withdraw/withdraw_state.dart';

class WithdrawCubit extends Cubit<WithDrawState>{
  WithdrawCubit():super(WithDrawInitial());

  bool checked = false;

  final amountController = TextEditingController();
  final commentController = TextEditingController();
  final totalSumController = TextEditingController();
  final addressSumController = TextEditingController();


  void showChecked(bool? value){
    checked =!checked;
    emit(WithDrawInitial());
  }
}