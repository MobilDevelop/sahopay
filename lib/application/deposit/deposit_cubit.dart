import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/deposit/deposit_state.dart';
import 'package:sahopay/domain/provider/deposit.dart';
import 'package:sahopay/infrastructure/models/universal/payment.dart';
import 'package:sahopay/infrastructure/models/deposit/wallet.dart';

class DepositCubit extends Cubit<DepositState>{
  DepositCubit():super(DepositInitial()){
    init();
  }

  bool loading =true;

  List<Wallet> walletItems = [];
  Wallet? selectedWalletItem;

 List<Payment> paymentItems = [];
 Payment? selectedPaymentItem;

  final amountController = TextEditingController();
  
  void init()async{
    walletItems = await DepositService().getWallet();
    paymentItems = await DepositService().getPayment();
    loading=false;
    emit(DepositInitial());
  }


  void onChangedWallet(Wallet selectWallet){
    selectedWalletItem =selectWallet;
    emit(DepositInitial());
  }


  void onChangedPayment(Payment selectPayment){
    selectedPaymentItem =selectPayment;
    emit(DepositInitial());
  }



  void sendDeposit(){}
}