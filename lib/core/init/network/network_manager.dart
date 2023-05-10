import 'inetwork.dart';
import 'networks/http_network.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;

  NetworkManager._init() {
    network = HttpNetwork();
  }

  INetwork network = HttpNetwork();

  Future<void> init() async => network.init();
}
