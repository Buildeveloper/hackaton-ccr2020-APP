import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String cellphone;
  final String birthDate;
  final int points;
  final String password;

  const User({
    this.id,
    this.firstName,
    this.lastName,
    this.cellphone,
    this.birthDate,
    this.points,
    this.password
  });


  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, '
        'cellphone: $cellphone, birthDate: $birthDate, points: $points, '
        'password: $password}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
