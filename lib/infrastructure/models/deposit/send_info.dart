class DepositSend{
  String amount;
  String network;
  String walletCurrensyName;

  DepositSend({required this.amount,required this.network,required this.walletCurrensyName});
 
  Map<String,dynamic> toJson()=>{
    "amount":amount,
    "network":network,
    "walletCurrencyName":walletCurrensyName
  };
}