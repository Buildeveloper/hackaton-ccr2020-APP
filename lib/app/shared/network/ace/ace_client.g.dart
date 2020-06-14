// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ace_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AceClient implements AceClient {
  _AceClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://hacka-ccr-api.herokuapp.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  login(login) async {
    ArgumentError.checkNotNull(login, 'login');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(login?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/user/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AceResponse<User>.fromJson(_result.data);
    return value;
  }
}
