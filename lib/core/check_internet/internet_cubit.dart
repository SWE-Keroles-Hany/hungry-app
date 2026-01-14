import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/check_internet/internet_states.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetCubit extends Cubit<InternetStates> {
  InternetCubit() : super(IntailInternetState());

  StreamSubscription<InternetConnectionStatus>? subscription;
  final _checker = InternetConnectionChecker.instance;

  void checkInternet() async {
    /// ✅ 1- check أولي
    final hasInternet = await _checker.hasConnection;
    if (hasInternet) {
      print("***Connected");
      emit(ConnectedInternetState());
    } else {
      emit(NotConnectedInternetState("No Internet Connection"));
    }

    /// ✅ 2- stream
    subscription = _checker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        print("***Connected");

        emit(ConnectedInternetState());
      } else {
        emit(NotConnectedInternetState("No Internet Connection"));
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
