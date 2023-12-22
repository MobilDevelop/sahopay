abstract class ExchangeState{}

class ExchangeInitial extends ExchangeState{}

class ExchangeMessage extends ExchangeState{
  String message;
  ExchangeMessage(this.message);
}