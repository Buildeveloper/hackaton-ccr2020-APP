import 'package:ace/app/shared/models/ace_response.dart';
import 'package:ace/app/shared/models/user/user.dart';
import 'package:ace/app/shared/network/ace/ace_client.dart';
import 'package:ace/app/shared/network/bodies/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AceApi {
  AceClient _client;
  Dio _dio = Modular.get();

  AceApi() {
    _client = AceClient(_dio);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<User> loginUser(Login login) async {
    AceResponse response = await _client.login(login);
    User user = User.fromJson(response.data["user"]);

    if (user.id == null)
      throw DioError(error: "USUARIO NÃO ENCONTRADO");

    return Future.value(user);
  }
}
