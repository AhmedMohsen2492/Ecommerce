import 'package:connectivity_plus/connectivity_plus.dart';

extension ConnectivityExtentions on Connectivity {
  Future<bool> get isInternetConnected async {
    final List<ConnectivityResult> result =
        await (Connectivity().checkConnectivity());
    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }
}
