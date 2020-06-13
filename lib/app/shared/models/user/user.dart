import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String nome;
  int id;
  String token;
  String email;
  String celular;
  String cpf;
  int autorizado;

  User({
    this.id,
    this.nome,
    this.token,
    this.email,
    this.celular,
    this.cpf,
    this.autorizado
  });


  @override
  String toString() {
    return 'User{nome: $nome, id: $id, token: $token, email: $email, '
        'celular: $celular, cpf: $cpf, autorizado: $autorizado}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
