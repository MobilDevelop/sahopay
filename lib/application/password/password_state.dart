abstract class PasswordState{}

class PasswordInitial extends PasswordState{}

class PasswordMessage extends PasswordState{
  String message;
  PasswordMessage(this.message);
}