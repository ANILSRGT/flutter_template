import 'dart:typed_data';

import 'network_response_model.dart';

abstract class INetwork {
  Future<void> init();
  Future<NetworkResponseModel> get(String url, {Map<String, String>? headers});
  Future<NetworkResponseModel> post(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body});
  Future<NetworkResponseModel> put(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body});
  Future<NetworkResponseModel> delete(String url, {Map<String, String>? headers});
  Future<NetworkResponseModel> patch(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body});
  Future<NetworkResponseModel> postFile(String url,
      {Map<String, String>? headers,
      Map<String, String>? body,
      required Uint8List imageCroppedBytes,
      String? fileName});
}
