List<Wallet>  walletItemFromMap(List list) =>
    List<Wallet>.from(list.map((items) => Wallet.fromJson(items)));

class Wallet {
  String account;
  String currencyName;
  String accountStatus;
  double hold;
  String logoUrl;
  double balance;

  Wallet({
    required this.account,
    required this.currencyName,
    required this.accountStatus,
    required this.hold,
    required this.logoUrl,
    required this.balance,
  });
  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        account: json['account'] ?? "",
        currencyName: json['currencyName'] ?? "",
        accountStatus: json['accountStatus'] ?? "",
        hold: json['hold'] ?? 0.00,
        logoUrl: json['logoUrl'] ?? "",
        balance: json['balance'] ?? 0.00,
      );
}
