abstract class DepositState{}

class DepositInitial extends DepositState{}

class DepositMessage extends DepositState{
  String message;
  DepositMessage(this.message);
}