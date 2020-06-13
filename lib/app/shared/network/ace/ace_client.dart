
import 'package:ace/app/shared/constants/urls.dart' as Urls;
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'ace_client.g.dart';

@RestApi(baseUrl: Urls.ACE_BASE_URL)
abstract class AceClient {
  factory AceClient(Dio dio, {String baseUrl}) = _AceClient;


}
