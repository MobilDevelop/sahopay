List<ExchangeRates> exchangeRateFromMap(List list) => List<ExchangeRates>.from(
    list.map((items) => ExchangeRates.fromJson(items)));

class ExchangeRates {
  int id;
  String currencyKey;
  String senderCurrency;
  String recipientCurrency;
  double rate;

  ExchangeRates(
      {required this.id,
      required this.currencyKey,
      required this.senderCurrency,
      required this.recipientCurrency,
      required this.rate,
      });

  factory ExchangeRates.fromJson(Map<String, dynamic> json) => ExchangeRates(
        id: json['id']?? -1,
        currencyKey: json['currencyKey'] ?? "",
        senderCurrency: json['senderCurrency']?? "",
        recipientCurrency: json['recipientCurrency'] ?? "",
        rate: json['rate']?? 0.0,
      );
}
