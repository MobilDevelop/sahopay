import 'package:sahopay/infrastructure/models/transfer/transfer_response.dart';

abstract class TransferState{}

class TransferInitial extends TransferState{}

class TransferMessage extends TransferState{
  String message;
  TransferMessage(this.message);
}

class TransferDialog extends TransferState{
  
  TransferResponse response;

  TransferDialog(this.response);
}