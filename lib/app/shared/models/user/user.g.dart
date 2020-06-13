// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    nome: json['nome'] as String,
    token: json['token'] as String,
    email: json['email'] as String,
    celular: json['celular'] as String,
    cpf: json['cpf'] as String,
    autorizado: json['autorizado'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nome': instance.nome,
      'id': instance.id,
      'token': instance.token,
      'email': instance.email,
      'celular': instance.celular,
      'cpf': instance.cpf,
      'autorizado': instance.autorizado,
    };
