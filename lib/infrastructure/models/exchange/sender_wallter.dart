
List<SenderWallet> senderWalletFromMap(List list)=>List<SenderWallet>.from(list.map((json) => SenderWallet.fromJson(json)));

class SenderWallet {
  String account;
  String currensyName;
  String accountStatus;
  double hold;
  String logoUrl;
  double balance;

  SenderWallet({required this.account,required this.currensyName,required this.accountStatus,required this.hold,required this.logoUrl,required this.balance});
  

  factory SenderWallet.fromJson(Map<String,dynamic> json)=>SenderWallet(
    account: json['account'], 
    currensyName: json['currencyName'], 
    accountStatus: json['accountStatus'], 
    hold: json['hold'], 
    logoUrl: json['logoUrl'], 
    balance: json['balance']);

}