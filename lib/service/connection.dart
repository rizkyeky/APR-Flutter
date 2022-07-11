part of 'service.dart';


class ConnectionService implements Service {
  final Connectivity _connectivity = Connectivity();
  ConnectionStatus? status;

  ConnectionService() {
    _connectivity.onConnectivityChanged.listen((value) {
      final curStatus = _getNetworkStatus(value);
      if (status != curStatus) {
        status = curStatus;
        // debugPrint(status.toString());
        if (injector.networkStatusNotifier?.value != status) {
          injector.networkStatusNotifier?.value = status!;
        }
      }
    });
  }

  @override
  Future<void> init() async {
    await _connectivity.checkConnectivity().then((value) {
      final curStatus = _getNetworkStatus(value);
      if (status != curStatus) {
        status = curStatus;
        // debugPrint(status.toString());
        if (injector.networkStatusNotifier?.value != status) {
          injector.networkStatusNotifier?.value = status!;
        }
      }
    });
  }

  ConnectionStatus _getNetworkStatus(ConnectivityResult status) {
    return status == ConnectivityResult.mobile ||
            status == ConnectivityResult.wifi
        ? ConnectionStatus.online
        : ConnectionStatus.offline;
  }

  @override
  void dispose() {
    injector.networkStatusNotifier?.dispose();
  }
}
