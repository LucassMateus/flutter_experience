import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:lab_clinicas_core/src/restClient/interceptors/auth_interceptor.dart';

final class RestClient extends DioForNative {
  RestClient(String baseUrl) 
      : super (
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 30)
          )
        ){
          interceptors.addAll([
            LogInterceptor(requestBody: true, responseBody: true),
            AuthInterceptor(),
          ]);
        }

  RestClient get auth{
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }
  RestClient get unauth{
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }
}