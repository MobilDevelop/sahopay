List<HistoryExchange> historyExchangeFromMap(List list)=>List<HistoryExchange>.from(list.map((json) => HistoryExchange.fromJson(json)));

class HistoryExchange{
  int id;
  String sender;
  String recipient;
  String trasactionStatus;
  String comment;
  String date;
  String pc;
  double amount;
  String senderCurrency;
  double conversionAmount;
  String recipientCurrency;
  double rate;
  String transactionType;
  String clientId;

  HistoryExchange({
    required this.id,
    required this.sender,
    required this.recipient,
    required this.trasactionStatus,
    required this.comment,
    required this.date,
    required this.pc,
    required this.amount,
    required this.senderCurrency,
    required this.conversionAmount,
    required this.recipientCurrency,
    required this.rate,
    required this.transactionType,
    required this.clientId,
  });

  factory HistoryExchange.fromJson(Map<String, dynamic> json) => HistoryExchange(
        id: json['id']?? -1,
        sender: json['sender'] ?? "",
        recipient: json['recipient'] ?? "",
        transactionType: json['transactionType'] ?? "",
        comment: json['comment'] ?? "",
        date: json['date'] ?? "",
        pc: json['pc'] ?? "",
        amount: json['amount'] ?? 0.0,
        senderCurrency: json['senderCurrency'] ?? "",
        conversionAmount: json['conversionAmount'] ?? 0.0,
        recipientCurrency: json['recipientCurrency'] ?? "",
        rate: json['rate'] ?? 0.0,
        trasactionStatus: json['transactionStatus'] ?? "",
        clientId: json['clientId'] ?? "",
      );


}