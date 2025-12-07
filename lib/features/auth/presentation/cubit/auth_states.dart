abstract class AuthStates {}

//! Intital
class AuthIntialState implements AuthStates {}

//! Login
class LoginErrorState implements AuthStates {
  final String message;
  LoginErrorState(this.message);
}

class LoginLoadingState implements AuthStates {}

class LoginSuccessState implements AuthStates {}

//! Sign Up
class SignUpErrorState implements AuthStates {
  final String message;
  SignUpErrorState(this.message);
}

class SignUpLoadingState implements AuthStates {}

class SignUpSuccessState implements AuthStates {}

//! Log out
class LogOutErrorState implements AuthStates {
  final String message;
  LogOutErrorState(this.message);
}

class LogOutLoadingState implements AuthStates {}

class LogOutSuccessState implements AuthStates {}

//! Is Logged In
class IsLoggedInErrorState implements AuthStates {
  final String message;
  IsLoggedInErrorState(this.message);
}

class IsLoggedInLoadingState implements AuthStates {}

class IsLoggedInSuccessState implements AuthStates {}
