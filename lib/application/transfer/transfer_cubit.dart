import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sahopay/application/transfer/transfer_state.dart';
import 'package:sahopay/domain/provider/transfer.dart';
import 'package:sahopay/infrastructure/models/dashboard/dashboard_model.dart';
import 'package:sahopay/infrastructure/models/transfer/calc_response.dart';
import 'package:sahopay/infrastructure/models/transfer/calculator.dart';
import 'package:sahopay/infrastructure/models/transfer/payment.dart';
import 'package:sahopay/infrastructure/models/transfer/post.dart';
import 'package:sahopay/infrastructure/models/transfer/transfer_response.dart';
import 'package:sahopay/infrastructure/models/universal/wallet_object.dart';

class TransferCubit extends Cubit<TransferState>{
  TransferCubit(DashboardModel? model):super(TransferInitial()){
    init(model);
  } 
  
  final amountController = TextEditingController();
  final commentController = TextEditingController();
  final totalSumController = TextEditingController();
  final numberController = TextEditingController();


  String accountNumber = "";

  bool checked = false;
  bool loading = true;
  bool numberBorder = false;
  bool amountBorder = false;
  bool enebled = false;

  List<TransferPayment> itemsPayment = [];
  TransferPayment? selectedPaymentItem;

  List<WalletObject> itemsWallet = [];
  WalletObject? selectedWalletItem;

  CalcResponse? calcResponse;

  dynamic maskFormatter =  MaskTextInputFormatter(
  mask: '#######', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);

  void init(DashboardModel? model)async{
   itemsPayment = await TransferService().getPayment();
   itemsWallet = await TransferService().getWallet();
   selectedPaymentItem = itemsPayment[0];
   if(model!=null){
    selectedWalletItem = WalletObject.fromJson(model.toJson());
    accountNumber = selectedWalletItem!.account.substring(0,1);
   }

   loading=false;
   emit(TransferInitial());
  }

  void sendTransfer()async{
    if(selectedPaymentItem!=null && selectedWalletItem!=null){
      String amount = amountController.text.trim();
      String recipient =accountNumber+numberController.text.trim();
      String systemId = selectedPaymentItem!.id.toString();
      String currensyName = selectedWalletItem!.currencyName;
      String comment = commentController.text.trim();

    if(recipient.length<7 ){
        numberBorder=true;
      }else{
        numberBorder=false;
      }
      if( amount.isEmpty){
        amountBorder=true;
      }else{
        amountBorder=false;
      }
      
        emit(TransferInitial()); 
        if(!numberBorder && !amountBorder){
         amountBorder=false;
         emit(TransferInitial());
            
          loading=true;
          emit(TransferInitial());
        TransferResponse info = await TransferService().transferSend(TransferPost( 
        amount: amount, 
        recipient: recipient, 
        recipientSystemId: systemId, 
        senderCurrencyName: currensyName, 
        comment: comment, 
        withCommission: checked).toJson());
         if(info.code==200){
          emit(TransferDialog(info));
         }else{
          EasyLoading.showInfo(info.message);
         }
        }
      }
      loading=false;
      emit(TransferInitial());
    }


    void setCalculator()async{
    String amount = amountController.text.trim();
    if(amount.length>=2){
    
    calcResponse= await TransferService().getCalcInfo(TransferCalc(
      amount: amount, 
      recipientSystemId: selectedPaymentItem!.id, 
      senderCurrencyType: selectedWalletItem!.currencyName, 
      senderWalletNumber: selectedWalletItem!.account.substring(0,1)+numberController.text, 
      withCommission: checked).toJson());
       
       totalSumController.text= calcResponse!.comissionAmount;
    }
    emit(TransferInitial());
  }

   void onSubmitted(String value){
     
     String amount = amountController.text.trim();

      if(amount.isNotEmpty){
         bool errAmount1 = double.parse(amount)<=selectedPaymentItem!.params[1].maxSum;
         bool errAmount2 = double.parse(amount)>=selectedPaymentItem!.params.last.maxSum;
     
     if(!errAmount1 || !errAmount2){
      amountBorder=true;
     }else{
      amountBorder=false;
      setCalculator();
     }
      }else{
        amountBorder=false;
        totalSumController.clear();
      }
       emit(TransferInitial());
  }

  void onChanged(String value){
    if(numberController.text.trim().isEmpty){
      numberController.text=selectedWalletItem!.account.substring(0,1);
      emit(TransferInitial());
    }
  }

  void pressMagnet(){
    if(selectedWalletItem==null || selectedPaymentItem==null){
    
    }else{
      amountController.text= selectedWalletItem!.balance.toString();
      setCalculator();
    }
    emit(TransferInitial());
  }



  void selectedSender(WalletObject wallet){
   
     emit(TransferInitial());
  }

  void selectedPayment(TransferPayment payment) {
    selectedPaymentItem = payment;
    emit(TransferInitial());
  }

  void selectedWallet(WalletObject wallet) {
    selectedWalletItem = wallet;
    accountNumber = selectedWalletItem!.account.substring(0,1);
    enebled=true;
    emit(TransferInitial());
  }

  void showChecked(bool? value){
    checked =!checked;
    setCalculator();
    emit(TransferInitial());
  }
}