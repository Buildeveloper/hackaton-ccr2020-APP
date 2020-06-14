
import 'package:ace/app/modules/home/models/benefit.dart';
import 'package:ace/app/shared/constants/urls.dart' as Urls;
import 'package:ace/app/shared/models/ace_response.dart';
import 'package:ace/app/shared/models/medicine.dart';
import 'package:ace/app/shared/models/user/user.dart';
import 'package:ace/app/shared/network/bodies/login.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'ace_client.g.dart';

@RestApi(baseUrl: Urls.ACE_BASE_URL)
abstract class AceClient {
  factory AceClient(Dio dio, {String baseUrl}) = _AceClient;

  @POST("/user/login")
  Future<AceResponse<User>> login(@Body() Login login);

  @GET("/medicines/{id}")
  Future<AceResponse<List<Medicine>>> getMedicines(@Path("id") int userId);

  @GET("/medicines/{id}/historic")
  Future<AceResponse<List<Medicine>>> getMedicinesHistory(@Path("id") int userId);

  @GET("/benefits")
  Future<AceResponse<List<Benefit>>> getBenefits();

}
