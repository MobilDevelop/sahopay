import 'package:sahopay/infrastructure/models/universal/payment.dart';
import 'package:sahopay/infrastructure/models/universal/payment_params.dart';

List<DepositPayment> depositPaymentFromMap(List list) => List<DepositPayment>.from(list.map((items) => DepositPayment.fromJson(items)));

class DepositPayment extends Payment {
  String clientId;
  String saldoPrefix;

  DepositPayment({
      required this.saldoPrefix,
      required this.clientId,
      required super.id,
      required super.systemName,
      required super.logoUrl,
      required super.accountStatus,
      required super.key,
      required super.commission,
      required super.maxSumDeposit,
      required super.minSumDeposit,
      required super.params,
  });

  factory DepositPayment.fromJson(Map<String, dynamic> json) => DepositPayment(
        id: json['id'],
        clientId: json['clientId'],
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