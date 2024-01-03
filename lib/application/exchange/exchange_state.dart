import 'package:sahopay/infrastructure/models/exchange/exchange_response.dart';

abstract class ExchangeState{}

class ExchangeInitial extends ExchangeState{}

class ExchangeMessage extends ExchangeState{
  String message;
  ExchangeMessage(this.message);
}

class ExchangeDialog extends ExchangeState{
  ExchangeResponse info;
  ExchangeDialog(this.info);
}