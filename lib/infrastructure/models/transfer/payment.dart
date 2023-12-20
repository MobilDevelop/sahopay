import 'package:sahopay/infrastructure/models/universal/payment.dart';
import 'package:sahopay/infrastructure/models/universal/payment_params.dart';

List<TransferPayment> transferItemsFromMap(List list) => List<TransferPayment>.from(list.map((items) => TransferPayment.fromJson(items)));

class TransferPayment extends Payment {
  String description;
  String saldoPrefix;
  String clientId;

  TransferPayment({
    required this.description,
    required this.clientId,
    required this.saldoPrefix,
    required super.id, 
    required super.systemName, 
    required super.logoUrl, 
    required super.accountStatus, 
    required super.key, 
    required super.commission, 
    required super.maxSumDeposit, 
    required super.minSumDeposit, 
    required super.params
  });

  factory TransferPayment.fromJson(Map<String, dynamic> json) => TransferPayment(
        id: json['id']?? -1,
        systemName: json['systemName'] ?? "",
        clientId: json['clientId'] ?? "",
        logoUrl: json['logoUrl'] ?? "",
        description: json['description'] ?? "",
        saldoPrefix: json['saldoPrefix'] ?? '',
        accountStatus: json['accountStatus'],
        key: json['key'],
        commission: json['commission'] ?? 0.00,
        maxSumDeposit: json['maxSumDeposit'] ?? 0.0,
        minSumDeposit: json['minSumDeposit'] ?? 0.0,
        params: paymentParamsFromMap(json['additionalParam'] ?? []),
      );
}