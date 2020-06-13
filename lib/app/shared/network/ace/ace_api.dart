import 'package:ace/app/shared/network/ace/ace_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AceApi {
  AceClient _client;
  Dio _dio = Modular.get();

  AceApi() {
    _client = AceClient(_dio);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}