class WithdrawPost{
  String amount;
  String network;
  String address;
  String currency;
  bool withCommission;

  WithdrawPost({
    required this.amount,
    required this.network,
    required this.address,
    required this.currency,
    required this.withCommission,
  });

  Map<String,dynamic> toJson()=>{
    "amount":amount,
    "network":network,
    "address":address,
    "currency":currency,
    "withCommission":withCommission,
 };
}