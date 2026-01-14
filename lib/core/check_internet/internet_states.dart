abstract class InternetStates {}

class IntailInternetState extends InternetStates {}

class ConnectedInternetState extends InternetStates {}

class NotConnectedInternetState extends InternetStates {
  final String message;
  NotConnectedInternetState(this.message);
}
