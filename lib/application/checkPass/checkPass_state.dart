abstract class CheckPassState{}

class CheckPassInitial extends CheckPassState{}

class CheckPassNextLogin extends CheckPassState{}

class CheckPassMessage extends CheckPassState{
  String message;
  CheckPassMessage(this.message);
}