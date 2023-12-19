class ExchangeAmount {
  String currencyKey;
  int senderAmount;
  String comment;

  ExchangeAmount({
    required this.currencyKey,
    required this.senderAmount,
    required this.comment,
  });

  factory ExchangeAmount.fromJson(Map<String, dynamic> json) => ExchangeAmount(
        currencyKey: json['currencyKey'] ?? -1,
        senderAmount: json['senderAmount'] ?? "",
        comment: json['comment'] ?? "",
      );
}