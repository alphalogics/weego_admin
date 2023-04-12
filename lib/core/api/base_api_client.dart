import 'package:dio/dio.dart';
import 'package:weego_admin/core/api/urls.dart';
import '../exceptions/network_exception.dart';
import '../utils/json_utils.dart';

abstract class BaseApiClient {
  void updateBaseUrl();

  Future<dynamic> get(String url,
      {Map<String, dynamic> headers, Map<String, dynamic> queryParameters});

  Future<dynamic> post(String url,
      {Map<String, dynamic> headers,
      Map<String, dynamic>? queryParameters,
      body});

  Future<dynamic> put(String url,
      {Map<String, dynamic> headers,
      Map<String, dynamic>? queryParameters,
      body});

  Future<dynamic> delete(String url, {Map<String, dynamic> headers, body});

  Future<dynamic> multipartFormPost(String url,
      {Map<String, dynamic> headers, body});

  Future<dynamic> multipartFormPut(String url,
      {Map<String, dynamic> headers, body});

  Future<dynamic> fromJsonFile(String jsonFilePath);
}

class BaseApiClientImpl implements BaseApiClient {
  final Dio _dio;

  bool retriedByUser = false;

  BaseApiClientImpl(this._dio) {
    _initApiClient();
  }

  void _initApiClient() {
    updateBaseUrl();
    _dio.options.connectTimeout = 45000;
    _dio.options.receiveTimeout = 45000;
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) {
      // var isAccessTokenExpired = AuthStore.to.isAccessTokenExpired();

      // if (AuthStore.to.isAccessTokenSaved()) {
      //   // if (isAccessTokenExpired) {
      //   //   AuthStore.to.logout();
      //   //   return handler.next(options);
      //   // }
      // }

      // if (!options.headers.containsKey("Authorization") &&
      //     AuthStore.to.accessToken != null) {
      //   options.headers["Authorization"] = "Bearer ${AuthStore.to.accessToken}";
      //   return handler.next(options);
      // }

      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (e, handler) {
      return handler.next(e);
    }));
  }

  // Future<void> renewAccessToken() async {
  //   updateBaseUrl();
  //   final refreshToken = AuthStore.to.refreshToken;
  //   final accessToken = AuthStore.to.accessToken;
  //
  //   try {
  //     var dio = Dio();
  //     updateBaseUrl();
  //     var headers = {'Authorization': 'Bearer $refreshToken'};
  //     final request = dio.post(URLs.refresh,
  //         data: {'accessToken': accessToken},
  //         options: Options(headers: headers));
  //     final response = await request;
  //
  //     if (response.statusCode == 200) {
  //       var newAccessToken = response.data['token'];
  //       await AuthStore.to.saveAccessTokenAsync(newAccessToken);
  //     }
  //   } catch (e) {
  //     // Logout
  //   }
  // }

  // Future<Response<dynamic>> _retry(
  //     RequestOptions requestOptions, bool retriedByUser) async {
  //   this.retriedByUser = retriedByUser;
  //   updateBaseUrl();
  //   // requestOptions.headers["Authorization"] =
  //   //     "Bearer ${AuthStore.to.accessToken}";
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );
  //   return _dio.request<dynamic>(requestOptions.path,
  //       data: requestOptions.data,
  //       queryParameters: requestOptions.queryParameters,
  //       options: options);
  // }

  @override
  updateBaseUrl() {
    // var useDefaultUrl = AppConfigStore.to.shouldUseDefaultUrl;
    var defaultUrl = URLs.baseUrl;
    // var storedUrl = AppConfigStore.to.appUrl;

    _dio.options.baseUrl = _getConfiguredBaseUrl(defaultUrl);

    // if (useDefaultUrl) {
    //   _dio.options.baseUrl = _getConfiguredBaseUrl(defaultUrl);
    // } else {
    //   _dio.options.baseUrl = _getConfiguredBaseUrl(storedUrl);
    // }
  }

  _getConfiguredBaseUrl(String url) {
    var urlLastChar = url.substring(url.length - 1);

    if (urlLastChar != '/') {
      url = url + '/';
    }

    return url;
  }

  @override
  Future<dynamic> get(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    updateBaseUrl();
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return response.data;
    } catch (e) {
      await handleError(e as DioError);
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    body,
    bool authorization = false,
  }) async {
    updateBaseUrl();
    try {
      final response = await _dio.post(url,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return response.data;
    } catch (e) {
      await handleError(e as DioError);
    }
  }

  @override
  Future put(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    body,
  }) async {
    updateBaseUrl();
    try {
      final response = await _dio.put(url,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));

      return response.data;
    } catch (e) {
      await handleError(e as DioError);
    }
  }

  @override
  Future delete(
    String url, {
    Map<String, dynamic>? headers,
    body,
  }) async {
    updateBaseUrl();
    try {
      final response = await _dio.delete(url,
          data: body ?? {}, options: Options(headers: headers));

      return response.data;
    } on DioError catch (e) {
      await handleError(e);
    }
  }

  @override
  Future multipartFormPost(String url,
      {Map<String, dynamic>? headers, body}) async {
    updateBaseUrl();
    try {
      final response = await _dio.post(url,
          data: body ?? {}, options: Options(headers: headers));

      return response.data;
    } on DioError catch (e) {
      await handleError(e);
    }
  }

  @override
  Future multipartFormPut(String url,
      {Map<String, dynamic>? headers, body}) async {
    updateBaseUrl();
    try {
      final response = await _dio.put(url,
          data: body ?? {}, options: Options(headers: headers));

      return response.data;
    } on DioError catch (e) {
      await handleError(e);
    }
  }

  @override
  Future fromJsonFile(String jsonFilePath) async {
    var path = jsonFilePath.substring(0,7);
    if(path == 'assets/') {
      jsonFilePath = jsonFilePath.substring(7);
    }
    return jsonFileToMap(jsonFilePath);
  }

  Future handleError(DioError e) async {
    var data = e.response?.data;

    if (data == null) {
      throw NetworkException.getDioException(e);
    }

    dynamic exception;
    try {
      var map = data as Map<String, dynamic>;
      var message = map['message'];
      if (message != '' || message != null) {
        exception = NetworkException.customServerException(message);
      } else {
        exception = e;
      }
    } catch (e) {
      exception = NetworkException.getDioException(e);
    }

    throw exception;
  }
}
