List<PaymentParams>  paymentParamsFromMap(List list) => List<PaymentParams>.from(
    list.map((items) => PaymentParams.fromJson(items)));
 
 class PaymentParams {
  String name;
  double maxSum;

  PaymentParams({
    required this.name,
    required this.maxSum,
  });

  factory PaymentParams.fromJson(Map<String, dynamic> json) => PaymentParams(
        name: json['name'],
        maxSum: json['required'] ?? "",
      );
}
