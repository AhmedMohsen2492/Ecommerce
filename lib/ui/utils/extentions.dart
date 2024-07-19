import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityExtentions on Connectivity{
  Future<bool> get isInternetConnected async{
    ConnectivityResult result = (await checkConnectivity()) as ConnectivityResult;
    return result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
  }
}