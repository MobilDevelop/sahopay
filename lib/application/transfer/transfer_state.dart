abstract class TransferState{}

class TransferInitial extends TransferState{}

class TransferMessage extends TransferState{
  String message;
  TransferMessage(this.message);
}