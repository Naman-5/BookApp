import 'dart:developer' as developer;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:bookapp/services/interceptors.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete;

  @override
  String toString() {
    switch (this) {
      case get:
        return 'GET';
      case post:
        return 'POST';
      case put:
        return 'PUT';
      case delete:
        return 'DELETE';
    }
  }
}

/// [ApiServices] provides all the baseUrls of different services
class ApiServices {
  static const localhost = 'http://127.0.0.1:5000';
}

class ApiController extends getx.GetxController {
  static const _logSource = 'bookApp.services.api';
  static const _clientSecret = 'client-secret';
  static const baseUrl = ApiServices.localhost;
  final client = Dio();

  ApiController() {
    // Add default configuration options
    client.options.baseUrl = baseUrl;
    client.options.connectTimeout = const Duration(seconds: 10000);
    client.options.contentType = ContentType.json.toString();
    client.options.headers['client-secret'] = _clientSecret;

    // Add Interceptors
    client.interceptors.addAll([
      // Add client-secret and auth-tokens to requests and manage refreshing tokens
      // InterceptorsWrapper(
      //   onRequest: (options, handler) {
      //     options.headers['client-secret'] = _clientSecret;
      //   },
      // ),
      CurlLogInterceptor(logOnSuccess: true),
    ]);
  }

  /// Sends Http requests and handles responses.
  ///
  /// Recommended to use one of the predefined values in [ApiServices]
  /// for [baseUrl]. Default is set to [ApiServices.user]
  ///
  /// Convention:
  /// - Add preceeding slash to [endpoint]
  /// - Do not include / at the end for [baseUrl].
  Future<Response?> fetch({
    required HttpMethod method,
    String? baseUrl,
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? additionalHeaders,
    dynamic body,
    ContentType? contentType,
    void Function(Response)? onSuccess,
    void Function(Response?)? onFailure,
  }) async {
    final path = '${baseUrl ?? client.options.baseUrl}$endpoint';
    if (additionalHeaders != null) {
      client.options.headers.addAll(additionalHeaders);
    }

    if (contentType != null) {
      client.options.headers['content-type'] = contentType.toString();
    }

    try {
      final response = await client.fetch(RequestOptions(
        path: path,
        method: method.toString(),
        queryParameters: queryParams,
        headers: client.options.headers,
        data: body,
      ));
      response
        ..onSuccess(onSuccess)
        ..onFailure(onFailure);

      return response;
    } catch (e) {
      if (e is DioError) {
        developer.log('Request Failed: ${e.response?.data ?? e.message}',
            name: _logSource, error: e);
      } else {
        developer.log('Something went Wrong!!', name: _logSource, error: e);
      }
      if (onFailure != null) onFailure(null);
      return null;
    }
  }
}

/// Provides response handlers based on the status code in the `Response`.
extension ResponseHandler on Response {
  Response onSuccess(void Function(Response)? function) {
    if (function != null &&
        (statusCode ?? -1) >= 200 &&
        (statusCode ?? -1) < 300) {
      function(this);
    }
    return this;
  }

  Response onFailure(void Function(Response?)? function) {
    if (function != null &&
        (statusCode ?? -1) < 200 &&
        (statusCode ?? -1) >= 300) {
      function(this);
    }
    return this;
  }
}
