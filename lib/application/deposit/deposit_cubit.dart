import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/deposit/deposit_state.dart';
import 'package:sahopay/domain/provider/deposit.dart';
import 'package:sahopay/infrastructure/models/deposit/deposit.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';

class DepositCubit extends Cubit<DepositState>{
  DepositCubit():super(DepositInitial()){
    init();
  }

  bool loading =true;

  List<WalletObject> walletItems = [];
  WalletObject? selectedWalletItem;

  List<DepositPayment> paymentItems = [];
  DepositPayment? selectedPaymentItem;

  final amountController = TextEditingController();
  
  void init()async{
    walletItems = await DepositService().getWallet();
    paymentItems = await DepositService().getPayment();
    loading=false;
    emit(DepositInitial());
  }


  void onChangedWallet(WalletObject selectWallet){
    selectedWalletItem =selectWallet;
    emit(DepositInitial());
  }


  void onChangedPayment(DepositPayment selectPayment){
    selectedPaymentItem =selectPayment;
    emit(DepositInitial());
  }



  void sendDeposit(){}
}