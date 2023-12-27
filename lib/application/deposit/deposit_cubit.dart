import 'package:flutter/material.dart';
import 'package:sahopay/application/deposit/deposit_state.dart';
import 'package:sahopay/domain/provider/deposit.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/infrastructure/models/deposit/deposit.dart';
import 'package:sahopay/infrastructure/models/deposit/send_info.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';
import 'package:sahopay/presentation/pages/login/library/login_library.dart';
import 'package:url_launcher/url_launcher.dart';

class DepositCubit extends Cubit<DepositState>{
  DepositCubit(DashboardModel? model):super(DepositInitial()){
    init(model);
  }

  bool loading =true;
  bool errorBorder =false;
  bool enebled = false;

  List<WalletObject> walletItems = [];
  WalletObject? selectedWalletItem;

  List<DepositPayment> paymentItems = [];
  DepositPayment? selectedPaymentItem;

  final amountController = TextEditingController();
  
  void init(DashboardModel? model)async{
    walletItems = await DepositService().getWallet();
    paymentItems = await DepositService().getPayment();
    
    if(model!=null){
      selectedWalletItem = WalletObject.fromJson(model.toJson());
    }

    loading=false;
    emit(DepositInitial());
  }

  void onChanged(){
    String amount = amountController.text.trim();
    if(amount.isNotEmpty){
      if(double.parse(amount)>selectedPaymentItem!.params[1].maxSum || double.parse(amount)<selectedPaymentItem!.params[2].maxSum){
      errorBorder=true;
    }else{
      errorBorder =false;
    }
    }else{
      errorBorder=false;
    }
     emit(DepositInitial());
  }


  void onChangedWallet(WalletObject selectWallet){
    selectedWalletItem =selectWallet;
    if(selectedPaymentItem!=null){
      enebled=true;
    }
    emit(DepositInitial());
  }


  void onChangedPayment(DepositPayment selectPayment){
    selectedPaymentItem =selectPayment;
    if(selectedWalletItem!=null){
      enebled=true;
    }
    emit(DepositInitial());
  }



  void sendDeposit()async{
    loading =true;
    emit(DepositInitial());
     
     String amount = amountController.text.trim();

    if(selectedPaymentItem==null || selectedWalletItem==null || amount.isEmpty){
      emit(DepositMessage(tr('universal.fillInfo')));
    }else{
       
      bool check1 = selectedPaymentItem!.params.first.maxSum>=double.parse(amount);
      bool check2 = selectedPaymentItem!.params.last.maxSum<=double.parse(amount);

      if(check1 && check2){
        errorBorder=false;
        emit(DepositInitial());
        String url = await DepositService().postInfo(DepositSend(
        amount: amountController.text.trim(), 
        network: selectedPaymentItem!.key, 
        walletCurrensyName: selectedWalletItem!.currencyName).toJson());
        
    final Uri _url = Uri.parse(url);
     await launchUrl(_url);
      }else{
        errorBorder=true;
      }
    }
    loading =false;
    emit(DepositInitial());
  }
}