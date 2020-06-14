import 'package:json_annotation/json_annotation.dart';

part "login.g.dart";

@JsonSerializable(explicitToJson: true)
class Login {
  final String cellphone;
  final String password;

  Login({
    this.cellphone,
    this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
