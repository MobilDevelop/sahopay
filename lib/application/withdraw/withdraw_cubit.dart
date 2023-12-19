import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/withdraw/withdraw_state.dart';
import 'package:sahopay/domain/provider/witdraw.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/infrastructure/models/withdraw/withdraw_payment.dart';

class WithdrawCubit extends Cubit<WithDrawState>{
  WithdrawCubit():super(WithDrawInitial()){
    init();
  }

  bool checked = false;
  bool loading = true;

  final amountController = TextEditingController();
  final commentController = TextEditingController();
  final totalSumController = TextEditingController();
  final addressSumController = TextEditingController();

  List<WithdrawPayment> itemsPayment = [];
  WithdrawPayment? selectedPaymentItem;

  List<WalletObject> itemsWallet = [];
  WalletObject? selectedWalletItem;

  void init()async{
   itemsPayment = await WithdrawService().getPayment();
   itemsWallet = await WithdrawService().getWallet();
   loading=false;
   emit(WithDrawInitial());
  }

   void selectedPayment(WithdrawPayment payment) {
    selectedPaymentItem = payment;
    emit(WithDrawInitial());
  }

  void selectedWallet(WalletObject wallet) {
    selectedWalletItem = wallet;
    emit(WithDrawInitial());
  }

  void showChecked(bool? value){
    checked =!checked;
    emit(WithDrawInitial());
  }
  
}