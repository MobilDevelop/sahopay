class CalculatorValue{
  String calAmount;
  String senderCurrensy;
  String recipientCurrensy;
  String rate;

  CalculatorValue({
    required this.calAmount,
    required this.senderCurrensy,
    required this.recipientCurrensy,
    required this.rate
  });

  factory CalculatorValue.fromJson(Map<String,dynamic> json)=>CalculatorValue(
    calAmount: json['calcAmount'].toString(), 
    senderCurrensy: json['senderCurrency'], 
    recipientCurrensy: json['recipientCurrency'], 
    rate: json['rate'].toString());
}