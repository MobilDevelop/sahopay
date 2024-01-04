abstract class RegistrationState{}

class RegistrationInitial extends RegistrationState{}

class RegistrationSucces extends RegistrationState{
  Map<String,dynamic> param;

  RegistrationSucces(this.param);
}

class RegistrationNextLogin extends RegistrationState{}

class RegistrationError extends RegistrationState{
  String message;
  RegistrationError(this.message);
}