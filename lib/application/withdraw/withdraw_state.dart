abstract class WithDrawState{}

class WithDrawInitial extends WithDrawState{}

class WithDrawMessage extends WithDrawState{
  String message;
  WithDrawMessage(this.message);
}