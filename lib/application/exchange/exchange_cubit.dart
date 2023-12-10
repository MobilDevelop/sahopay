import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/exchange/exchange_state.dart';

class ExchangeCubit extends Cubit<ExchangeState>{
  ExchangeCubit():super(ExchangeInitial());

  final amountController = TextEditingController();
  final commentController = TextEditingController();

  void buttonExchange(){
    
  }
}