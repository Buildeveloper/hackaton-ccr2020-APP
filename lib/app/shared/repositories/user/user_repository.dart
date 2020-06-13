import 'dart:convert';
import 'package:ace/app/shared/models/user/user.dart';
import 'package:ace/app/shared/network/request_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ace/app/shared/models/user/user.dart';
import 'package:ace/app/shared/network/api.dart';
import 'package:ace/app/shared/repositories/user/user_repository_interface.dart';
import 'package:ace/app/shared/repositories/storage/storage_manager_interface.dart';

class UserRepository implements IUserRepository {
  final IStorageManager _storage = Modular.get();
  final Api _api = Modular.get();

  @override
  Future<User> getLoggedUser() async {
    final userString = await _storage.get("user") as String;
    Map<String, dynamic> userMap = jsonDecode(userString);
    print("MAP: $userMap");
    final user = User.fromJson(userMap);
    return Future.value(user);
  }

  @override
  Future<String> getToken() async {
    return _storage.get("token").toString();
  }

  @override
  Future<bool> registerToken(String token) async {
    try {
      await _storage.put("token", "bearer $token");
      return Future.value(true);
    } catch (e) {
      print(e);
    }

    return Future.value(false);
  }

  @override
  Future<bool> logoutUser() async {
    try {
      await _storage.delete("user");
      await _storage.delete("logged");

      return Future.value(true);
    } catch (e) {
      print(e);
    }

    return Future.value(false);
  }

  @override
  Future<bool> registerLogin() async {
    try {
      await _storage.put("logged", true);

      return Future.value(true);
    } catch (e) {
      print(e);
    }

    return Future.value(false);
  }

  @override
  Future<bool> registerUser(User user) async {
    try {
      await _storage.put("user", jsonEncode(user.toJson()));
      await registerToken(user.token);
      return Future.value(true);
    } catch (e) {
      print(e);
    }
    return Future.value(false);
  }

  @override
  Future<bool> isUserLogged() async {
    var logged = await _storage.get("logged") as bool;

    if (logged == null) logged = false;

    return Future.value(logged);
  }

//  @override
//  Future<User> login(BuildContext context, Login login) =>
//      RequestManager.loadingRequest(context, _api.beople.login(login));
}
