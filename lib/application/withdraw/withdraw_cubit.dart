import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahopay/application/withdraw/withdraw_state.dart';
import 'package:sahopay/domain/provider/witdraw.dart';
import 'package:sahopay/infrastructure/helper/helper.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/infrastructure/models/withdraw/calculator.dart';
import 'package:sahopay/infrastructure/models/withdraw/payment.dart';
import 'package:sahopay/infrastructure/models/withdraw/post.dart';
import 'package:sahopay/infrastructure/models/withdraw/withdraw_response.dart';

class WithdrawCubit extends Cubit<WithDrawState>{
  WithdrawCubit(DashboardModel? model):super(WithDrawInitial()){
    init(model);
  }

  bool checked = false;
  bool loading = true;
  bool totalEnebled = false;
  bool amountBorder =false;
  bool emailBorder =false;

  bool maxMoney =false;

  final amountController = TextEditingController();
  final commentController = TextEditingController();
  final totalSumController = TextEditingController();
  final addressSumController = TextEditingController();

  List<WithdrawPayment> itemsPayment = [];
  WithdrawPayment? selectedPaymentItem;

  List<WalletObject> itemsWallet = [];
  WalletObject? selectedWalletItem;

  void init(DashboardModel? model)async{
   itemsPayment = await WithdrawService().getPayment();
   itemsWallet = await WithdrawService().getWallet();
    
    if(model!=null){
      selectedWalletItem = WalletObject.fromJson(model.toJson());
    }

   loading=false;
   emit(WithDrawInitial());
  }


  void sendInfo()async{
      String address = addressSumController.text.trim();
      String amount = amountController.text.trim();
     if(selectedPaymentItem!=null && selectedWalletItem!=null){
       
      if(Helper.isEmail(address)){
        emailBorder=true;
       }else{
        emailBorder=false;
       }

       if(amount.isEmpty){
        amountBorder=true;
       }
      
       if(!emailBorder && !amountBorder){
        
      WithdrawResponse info = await WithdrawService().sendInfo(WithdrawPost(
      amount: amount, 
      network: selectedPaymentItem!.key, 
      address: address, 
      currency: selectedWalletItem!.currencyName, 
      withCommission: checked).toJson());
      emit(WithDrawDialog(info));
       }
     }
     emit(WithDrawInitial());
  }
  
  void calculate()async{
    if(amountController.text.trim().isNotEmpty){
      
      String amount = amountController.text.trim();

      if(double.parse(amount)>selectedWalletItem!.balance){
        amountBorder=true;
      }else{
        amountBorder=false;
      }
      
      if(double.parse(amount)>selectedPaymentItem!.params[1].maxSum){
        maxMoney=true;
      }else{
        maxMoney=false;
      }

      if(double.parse(amount)<selectedPaymentItem!.params[2].maxSum){
        maxMoney=true;
      }else{
        maxMoney=false;
      }

      emit(WithDrawInitial());
       String info = await WithdrawService().calculate(WithdrawCalc(
      amount: amountController.text.trim(), 
      recipientSystemId: selectedPaymentItem!.id, 
      senderCurrencyType: selectedWalletItem!.currencyName, 
      senderWalletNumber: selectedWalletItem!.account, 
      withCommission: checked).toJson());
      

      totalSumController.text=info;
    }else{
      amountBorder=false;
      totalSumController.clear();
    }
         emit(WithDrawInitial());
  }

    void pressMagnet(){
    if(selectedWalletItem==null || selectedPaymentItem==null){
    
    }else{
      amountController.text= selectedWalletItem!.balance.toString();
      calculate();
    }
    emit(WithDrawInitial());
  }
   

   void selectedPayment(WithdrawPayment payment) {
    selectedPaymentItem = payment;
    if(selectedWalletItem!=null){
      totalEnebled=true;
    }
    emit(WithDrawInitial());
  }

  void selectedWallet(WalletObject wallet) {
    selectedWalletItem = wallet;
    if(selectedPaymentItem!=null){
      totalEnebled=true;
    }
    emit(WithDrawInitial());
  }

  void showChecked(bool? value){
    checked =!checked;
    calculate();
    emit(WithDrawInitial());
  }

  Future listRefresh()async{
    selectedPaymentItem=null;
    selectedWalletItem=null;
    amountBorder=false;
    emailBorder=false;
    checked=false;
    addressSumController.clear();
    amountController.clear();
    loading=true;
    emit(WithDrawInitial());
    init(null);
  }
  
}