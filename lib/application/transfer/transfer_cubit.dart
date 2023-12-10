import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/transfer/transfer_state.dart';

class TransferCubit extends Cubit<TransferState>{
  TransferCubit():super(TransferInitial());

  bool checked = false;

  final amountController = TextEditingController();
  final commentController = TextEditingController();
  final totalSumController = TextEditingController();


  void showChecked(bool? value){
    checked =!checked;
    emit(TransferInitial());
  }
}