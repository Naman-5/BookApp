import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class CurlLogInterceptor extends Interceptor {
  static const _logSource = 'bookApp.services.api.curl';
  final bool? logOnSuccess;
  final bool convertFormData;

  CurlLogInterceptor({this.logOnSuccess, this.convertFormData = true});

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (logOnSuccess != null && logOnSuccess == true) {
      _renderCurlRepresentation(response.requestOptions);
    }

    return handler.next(response); //continue
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _renderCurlRepresentation(err.requestOptions);

    return handler.next(err); //continue
  }

  void _renderCurlRepresentation(RequestOptions requestOptions) {
    // add a breakpoint here so all errors can break
    try {
      log(_cURLRepresentation(requestOptions), name: _logSource);
    } catch (err) {
      log('unable to create a CURL representation of the requestOptions',
          name: _logSource);
    }
  }

  String _cURLRepresentation(RequestOptions options) {
    List<String> components = ['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      // FormData can't be JSON-serialized, so keep only their fields attributes
      if (options.data is FormData && convertFormData == true) {
        options.data = Map.fromEntries(options.data.fields);
      }

      final data = json.encode(options.data).replaceAll('"', '\\"');
      components.add('-d "$data"');
    }

    components.add('"${options.uri.toString()}"');

    return components.join(' \\\n\t');
  }
}
