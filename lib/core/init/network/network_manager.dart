import 'dart:typed_data';

import 'inetwork.dart';
import 'network_response_model.dart';
import 'networks/http_network.dart';

class NetworkManager implements INetwork {
  static final NetworkManager _instance = NetworkManager._init();
  static NetworkManager get instance => _instance;

  NetworkManager._init() {
    _network = HttpNetwork();
  }

  INetwork? _network;

  @override
  Future<void> init() async => _network?.init();

  @override
  Future<NetworkResponseModel> get(String url, {Map<String, String>? headers}) async {
    final response = await _network!.get(url, headers: headers);
    return response;
  }

  @override
  Future<NetworkResponseModel> post(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final response = await _network!.post(url, headers: headers, body: body);
    return response;
  }

  @override
  Future<NetworkResponseModel> put(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final response = await _network!.put(url, headers: headers, body: body);
    return response;
  }

  @override
  Future<NetworkResponseModel> delete(String url, {Map<String, String>? headers}) async {
    final response = await _network!.delete(url, headers: headers);
    return response;
  }

  @override
  Future<NetworkResponseModel> patch(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    final response = await _network!.patch(url, headers: headers, body: body);
    return response;
  }

  @override
  Future<NetworkResponseModel> postFile(String url,
      {Map<String, String>? headers,
      Map<String, String>? body,
      required Uint8List imageCroppedBytes,
      String? fileName}) async {
    final response = await _network!.postFile(
      url,
      headers: headers,
      body: body,
      imageCroppedBytes: imageCroppedBytes,
      fileName: fileName,
    );
    return response;
  }
}
