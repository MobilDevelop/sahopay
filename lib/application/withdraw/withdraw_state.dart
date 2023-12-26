import 'package:sahopay/infrastructure/models/withdraw/withdraw_response.dart';

abstract class WithDrawState{}

class WithDrawInitial extends WithDrawState{}

class WithDrawMessage extends WithDrawState{
  String message;
  WithDrawMessage(this.message);
}

class WithDrawDialog extends WithDrawState{
  
  WithdrawResponse response;
  WithDrawDialog(this.response);
}