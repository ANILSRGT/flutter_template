import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../../constants/network/error_codes_constants.dart';
import '../../../extension/all_extensions.dart' show NetworkExtension;
import '../inetwork.dart';
import '../network_response_model.dart';

class HttpNetwork implements INetwork {
  Map<String, String>? _applySettingsHeader(Map<String, String>? headers) {
    final headers0 = headers ?? {};
    headers0['Content-Type'] = 'application/json';
    headers0['Accept'] = 'application/json';
    return headers0;
  }

  @override
  Future<void> init() async {}

  @override
  Future<NetworkResponseModel> get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: _applySettingsHeader(headers),
      );
      return NetworkResponseModel(
        hasError: response.statusCode != 200,
        statusCode: response.statusCode,
        statusMessage: response.reasonPhrase ?? ErrorCodes.networkError.errorGlobalMessage("00"),
        data: json.decode(response.body),
      );
    } catch (e) {
      return NetworkResponseModel(
        hasError: true,
        statusCode: 500,
        statusMessage: ErrorCodes.networkError.errorGlobalMessage("01"),
        data: null,
      );
    }
  }

  @override
  Future<NetworkResponseModel> post(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body.toStrJson,
        headers: _applySettingsHeader(headers),
      );
      return NetworkResponseModel(
        hasError: response.statusCode != 200,
        statusCode: response.statusCode,
        statusMessage: response.reasonPhrase ?? ErrorCodes.networkError.errorGlobalMessage("10"),
        data: json.decode(response.body),
      );
    } catch (e) {
      return NetworkResponseModel(
        hasError: true,
        statusCode: 500,
        statusMessage: ErrorCodes.networkError.errorGlobalMessage("11"),
        data: null,
      );
    }
  }

  @override
  Future<NetworkResponseModel> put(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        body: body.toStrJson,
        headers: _applySettingsHeader(headers),
      );
      return NetworkResponseModel(
        hasError: response.statusCode != 200,
        statusCode: response.statusCode,
        statusMessage: response.reasonPhrase ?? ErrorCodes.networkError.errorGlobalMessage("20"),
        data: json.decode(response.body),
      );
    } catch (e) {
      return NetworkResponseModel(
        hasError: true,
        statusCode: 500,
        statusMessage: ErrorCodes.networkError.errorGlobalMessage("21"),
        data: null,
      );
    }
  }

  @override
  Future<NetworkResponseModel> delete(String url, {Map<String, String>? headers}) async {
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: _applySettingsHeader(headers),
      );
      return NetworkResponseModel(
        hasError: response.statusCode != 200,
        statusCode: response.statusCode,
        statusMessage: response.reasonPhrase ?? ErrorCodes.networkError.errorGlobalMessage("30"),
        data: json.decode(response.body),
      );
    } catch (e) {
      return NetworkResponseModel(
        hasError: true,
        statusCode: 500,
        statusMessage: ErrorCodes.networkError.errorGlobalMessage("31"),
        data: null,
      );
    }
  }

  @override
  Future<NetworkResponseModel> patch(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      final response = await http.patch(
        Uri.parse(url),
        body: body.toStrJson,
        headers: _applySettingsHeader(headers),
      );
      return NetworkResponseModel(
        hasError: response.statusCode != 200,
        statusCode: response.statusCode,
        statusMessage: response.reasonPhrase ?? ErrorCodes.networkError.errorGlobalMessage("40"),
        data: json.decode(response.body),
      );
    } catch (e) {
      return NetworkResponseModel(
        hasError: true,
        statusCode: 500,
        statusMessage: ErrorCodes.networkError.errorGlobalMessage("41"),
        data: null,
      );
    }
  }

  @override
  Future<NetworkResponseModel> postFile(String url,
      {Map<String, String>? headers,
      Map<String, String>? body,
      required Uint8List imageCroppedBytes,
      String? fileName}) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));
      if (headers != null) {
        request.headers.addAll(headers);
      }
      if (body != null) {
        request.fields.addAll(body);
      }
      request.files.add(
        http.MultipartFile.fromBytes(
          'file',
          imageCroppedBytes,
          filename: fileName ?? 'image.jpg',
        ),
      );
      final response = await request.send();
      final resBody = await response.stream.bytesToString();
      return NetworkResponseModel(
        hasError: response.statusCode != 200,
        statusCode: response.statusCode,
        statusMessage: response.reasonPhrase ?? ErrorCodes.networkError.errorGlobalMessage("50"),
        data: json.decode(resBody),
      );
    } catch (e) {
      return NetworkResponseModel(
        hasError: true,
        statusCode: 500,
        statusMessage: ErrorCodes.networkError.errorGlobalMessage("51"),
        data: null,
      );
    }
  }
}
