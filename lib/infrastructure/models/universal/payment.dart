import 'package:sahopay/infrastructure/models/universal/payment_params.dart';

List<Payment> paymentItemsFromMap(List list) => List<Payment>.from(
    list.map((items) => Payment.fromJson(items)));

class Payment {
  int id;
  String systemName;
  String logoUrl;
  String saldoPrefix;
  String accountStatus;
  String key;
  double commission;
  double maxSumDeposit;
  double minSumDeposit;
  List<PaymentParams> params;

  Payment(
      {required this.id,
      required this.systemName,
      required this.logoUrl,
      required this.saldoPrefix,
      required this.accountStatus,
      required this.key,
      required this.commission,
      required this.maxSumDeposit,
      required this.minSumDeposit,
      required this.params,
      });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json['id'],
        systemName: json['systemName'] ?? "",
        logoUrl: json['logoUrl'],
        saldoPrefix: json['saldoPrefix'] ?? '',
        accountStatus: json['accountStatus'],
        key: json['key'],
        commission: json['commission'],
        maxSumDeposit: json['maxSumDeposit'],
        minSumDeposit: json['minSumDeposit'],
        params: paymentParamsFromMap(json['additionalParam']),
      );
}
