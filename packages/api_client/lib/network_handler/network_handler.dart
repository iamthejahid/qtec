// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field, depend_on_referenced_packages, lines_longer_than_80_chars

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:api_client/network_handler/network.dart';
import 'package:api_client/util/toaster.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  NetworkHandler._();

  static final NetworkHandler instance = NetworkHandler._();

  String? _token;
  late String _baseUrl;
  late bool _enableDialogue;
  late bool _showLogs;
  late Client client;
  // This ref is only for 401 handling.
  // late WidgetRef _ref;

  void setup({
    required String baseUrl,
    bool showLogs = false,
    bool enableDialogue = true,
  }) {
    client = Client();
    _baseUrl = baseUrl;
    _showLogs = showLogs;
    _enableDialogue = enableDialogue;
  }

  // ignore: avoid_setters_without_getters
  void setToken(String? token) => _token = token;

  // void setRef(WidgetRef ref) => _ref = ref;

  Map<String, String> header({
    required bool withToken,
    bool isMultipart = false,
  }) {
    if (withToken) {
      return {
        'Content-Type': isMultipart
            ? 'multipart/form-data'
            : 'application/json; charset=UTF-8',
        if (!isMultipart) 'Content': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        if (_token != null && _token!.isNotEmpty)
          'Authorization': 'Bearer $_token',
      };
    } else {
      return {
        'Content-Type': 'application/json; charset=UTF-8',
        'Content': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };
    }
  }

  Future<Either<CleanFailure, T>> get<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    bool withToken = true,
  }) async {
    final _header = header(withToken: withToken);

    final url = Uri.parse('$_baseUrl$endPoint');
    Logger.v('URL : $url, Header : $_header');

    try {
      final response = await client.get(
        url,
        headers: _header,
      );

      return handleResponse<T>(
        response: response,
        endPoint: endPoint,
        fromData: fromData,
      );
    } on SocketException {
      Logger.e('<<SocketException>>');
      Toaster.errorToast(warningMessage: 'No Internet connection');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'No Internet connection 😑'},
        ),
      );
    } on HttpException {
      Logger.e('<<HttpException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': "Couldn't find 😱"},
        ),
      );
    } on FormatException {
      Logger.e('<<FormatException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'Bad response format 👎'},
        ),
      );
    } catch (e) {
      Logger.e('1st catch Header: $_header');
      Logger.e('1st catch Error: $e');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: e.toString(),
        ),
      );
    }
  }

  Future<Either<CleanFailure, T>> post<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    required Map<String, dynamic> body,
    bool withToken = true,
  }) async {
    final _header = header(withToken: withToken);

    final url = Uri.parse('$_baseUrl$endPoint');
    Logger.v('URL : $url, Header : $_header');
    Logger.v('BODY : $body');

    try {
      final response = await client.post(
        url,
        headers: _header,
        body: jsonEncode(body),
      );

      return handleResponse(
        endPoint: endPoint,
        response: response,
        fromData: fromData,
      );
    } on SocketException {
      Logger.e('<<SocketException>>');
      Toaster.errorToast(warningMessage: 'No Internet connection');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'No Internet connection 😑'},
        ),
      );
    } on HttpException {
      Logger.e('<<HttpException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': "Couldn't find 😱"},
        ),
      );
    } on FormatException {
      Logger.e('<<FormatException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'Bad response format 👎'},
        ),
      );
    } catch (e) {
      Logger.e('1st catch Header: $_header');
      Logger.e('1st catch Error: $e');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: e.toString(),
        ),
      );
    }
  }

  Future<Either<CleanFailure, T>> put<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    required Map<String, dynamic> body,
    bool withToken = true,
  }) async {
    Logger.v('BODY : $body');

    final _header = header(withToken: withToken);

    final url = Uri.parse('$_baseUrl$endPoint');
    Logger.v('URL : $url, Header : $_header');
    Logger.v('BODY : $body');

    try {
      final response = await client.put(
        url,
        headers: _header,
        body: jsonEncode(body),
      );

      return handleResponse(
        endPoint: endPoint,
        response: response,
        fromData: fromData,
      );
    } on SocketException {
      Logger.e('<<SocketException>>');
      Toaster.errorToast(warningMessage: 'No Internet connection');

      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'No Internet connection 😑'},
        ),
      );
    } on HttpException {
      Logger.e('<<HttpException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': "Couldn't find 😱"},
        ),
      );
    } on FormatException {
      Logger.e('<<FormatException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'Bad response format 👎'},
        ),
      );
    } catch (e) {
      Logger.e('1st catch Header: $_header');
      Logger.e('1st catch Error: $e');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: e.toString(),
        ),
      );
    }
  }

  Future<Either<CleanFailure, T>> patch<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    required Map<String, dynamic> body,
    bool withToken = true,
  }) async {
    final _header = header(withToken: withToken);

    final url = Uri.parse('$_baseUrl$endPoint');

    Logger.v('URL : $url, Header : $_header');
    Logger.v('BODY : $body');

    try {
      final response = await client.patch(
        url,
        headers: _header,
        body: jsonEncode(body),
      );

      return handleResponse(
        endPoint: endPoint,
        response: response,
        fromData: fromData,
      );
    } on SocketException {
      Logger.e('<<SocketException>>');
      Toaster.errorToast(warningMessage: 'No Internet connection');

      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'No Internet connection 😑'},
        ),
      );
    } on HttpException {
      Logger.e('<<HttpException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': "Couldn't find 😱"},
        ),
      );
    } on FormatException {
      Logger.e('<<FormatException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'Bad response format 👎'},
        ),
      );
    } catch (e) {
      Logger.e('1st catch Header: $_header');
      Logger.e('1st catch Error: $e');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: e.toString(),
        ),
      );
    }
  }

  Future<Either<CleanFailure, T>> imageUpload<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    required Map<String, dynamic> body,
    required File imageFile,
    bool withToken = true,
  }) async {
    Logger.v('BODY : $body');
    Logger.v('Image : ${imageFile.path}');

    final _header = header(
      withToken: withToken,
      isMultipart: true,
    );

    final url = Uri.parse('$_baseUrl$endPoint');
    Logger.v('URL : $url, Header : $_header');
    Logger.v('BODY : $body');

    try {
      final request = http.MultipartRequest('POST', url);
      // final file =
      //     await http.MultipartFile.fromPath('ImageFile', imageFile.path);
      log(imageFile.lengthSync().toString(), name: "FILE SIZE");
      final file = http.MultipartFile('ImageFile',
          imageFile.readAsBytes().asStream(), imageFile.lengthSync(),
          filename: imageFile.path.split("/").last);
      request.files.add(file);

      body.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      request.headers.addAll(_header);

      final streamedResponse = await client.send(request);

      log(streamedResponse.statusCode.toString(), name: "Header Exx");
      log(streamedResponse.toString(), name: "Header Exx");

      List<int> bytes = await streamedResponse.stream.toBytes();

      http.Response httpResponse =
          http.Response.bytes(bytes, streamedResponse.statusCode);

      return handleResponse(
        endPoint: endPoint,
        response: httpResponse,
        fromData: fromData,
      );
    } on SocketException {
      Logger.e('<<SocketException>>');
      Toaster.errorToast(warningMessage: 'No Internet connection');

      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'No Internet connection 😑'},
        ),
      );
    } on HttpException {
      Logger.e('<<HttpException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': "Couldn't find 😱"},
        ),
      );
    } on FormatException {
      Logger.e('<<FormatException>>');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: const {'message': 'Bad response format 👎'},
        ),
      );
    } catch (e) {
      Logger.e('1st catch Header: $_header');
      Logger.e('1st catch Error: $e');
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: '$_baseUrl$endPoint',
          header: _header,
          body: const {},
          error: e.toString(),
        ),
      );
    }
  }

  Either<CleanFailure, T> handleResponse<T>({
    required Response response,
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
  }) {
    Logger.v('request: ${response.request}');
    Logger.json(response.body);

    if (isSuccessful(response.statusCode)) {
      final _regResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      try {
        final _typedResponse = fromData(_regResponse);
        Logger.i('parsed data: $_typedResponse');
        return right(_typedResponse);
      } catch (e, err) {
        log(err.toString(), name: "STACKRACE");
        Logger.w('header: ${response.request?.headers}');
        // Logger.w("request: ${response.request}");

        Logger.w('body: ${response.body}');
        Logger.w('status code: ${response.statusCode}');
        Logger.w('error: $e');
        return left(
          CleanFailure.withData(
            tag: endPoint,
            url: response.request?.url.toString() ?? '',
            method: response.request?.method ?? '',
            statusCode: response.statusCode,
            header: response.request?.headers ?? {},
            body: _regResponse,
            error: e,
          ),
        );
      }
    } else {
      Logger.e('header: ${response.request?.headers}');
      // Logger.w("request: ${response.request}");

      Logger.e('body: ${response.body}');
      Logger.e('status code: ${response.statusCode}');

      final e = jsonDecode(response.body);
      if (e["message"] != null) {
        Toaster.errorToast(warningMessage: e["message"].toString());
      }

      return left(
        CleanFailure.withData(
          statusCode: response.statusCode,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: response.request?.method ?? '',
          url: response.request?.url.toString() ?? '',
          header: response.request?.headers ?? {},
          body: const {},
          error: jsonDecode(response.body),
        ),
      );
    }
  }

  void clearToken() {
    _token = "";
    // _ref.watch(hiveProvider).cleanBox();
  }

  bool isSuccessful(int code) {
    if (code == 401) {
      clearToken();
    }
    return code >= 200 && code <= 299;
  }
}
