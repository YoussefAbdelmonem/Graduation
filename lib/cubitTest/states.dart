abstract class LoginStates {}
class Initial extends LoginStates{}
class SecureChange extends LoginStates{}
class Load extends LoginStates{}
class Success extends LoginStates{}
class Error extends LoginStates{
  final String error;

  Error(this.error);
}
