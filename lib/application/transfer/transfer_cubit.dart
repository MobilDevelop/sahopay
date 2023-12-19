import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/transfer/transfer_state.dart';
import 'package:sahopay/domain/provider/transfer.dart';
import 'package:sahopay/infrastructure/models/transfer/transfer.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';

class TransferCubit extends Cubit<TransferState>{
  TransferCubit():super(TransferInitial()){
    init();
  } 
  
  final amountController = TextEditingController();
  final commentController = TextEditingController();
  final totalSumController = TextEditingController();

  bool checked = false;
  bool loading = true;

  List<TransferPayment> itemsPayment = [];
  TransferPayment? selectedPaymentItem;

  List<WalletObject> itemsWallet = [];
  WalletObject? selectedWalletItem;

  void init()async{

   itemsPayment = await TransferService().getPayment();
   itemsWallet = await TransferService().getWallet();
  
  loading=false;
  emit(TransferInitial());
  }

  void selectedPayment(TransferPayment payment) {
    selectedPaymentItem = payment;
    emit(TransferInitial());
  }

  void selectedWallet(WalletObject wallet) {
    selectedWalletItem = wallet;
    emit(TransferInitial());
  }

  void showChecked(bool? value){
    checked =!checked;
    emit(TransferInitial());
  }
}