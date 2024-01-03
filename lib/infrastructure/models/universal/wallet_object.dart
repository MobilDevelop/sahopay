List<WalletObject>  walletItemFromMap(List list) =>
    List<WalletObject>.from(list.map((items) => WalletObject.fromJson(items)));

class WalletObject {
  String account;
  String currencyName;
  String accountStatus;
  double hold;
  String logoUrl;
  double balance;

  WalletObject({
    required this.account,
    required this.currencyName,
    required this.accountStatus,
    required this.hold,
    required this.logoUrl, 
    required this.balance,
  });
  factory WalletObject.fromJson(Map<String, dynamic> json) => WalletObject(
        account: json['account'] ?? "",
        currencyName: json['currencyName'] ?? "",
        accountStatus: json['accountStatus'] ?? "",
        hold: json['hold'] ?? 0.00,
        logoUrl: json['logoUrl'] ?? "",
        balance: json['balance'] ?? 0.00,
      );
}
