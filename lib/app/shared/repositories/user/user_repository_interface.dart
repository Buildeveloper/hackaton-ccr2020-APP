import 'package:ace/app/shared/models/user/user.dart';
import 'package:ace/app/shared/network/bodies/login.dart';
import 'package:flutter/cupertino.dart';

abstract class IUserRepository {
  Future<User> getLoggedUser();

  Future<bool> logoutUser();

  Future<bool> registerLogin();

  Future<bool> registerUser(User user);

  Future<bool> isUserLogged();

  Future<User> login(BuildContext context, Login login);
}