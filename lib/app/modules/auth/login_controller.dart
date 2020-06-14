import 'package:ace/app/modules/auth/interfaces/ILoginView.dart';
import 'package:ace/app/shared/auth/auth_controller.dart';
import 'package:ace/app/shared/models/user/user.dart';
import 'package:ace/app/shared/network/bodies/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthController _authController = Modular.get();
  BuildContext _context;
  ILoginView _view;

  User user;

  void init(ILoginView iLoginView, BuildContext context) {
    _context = context;
    _view = iLoginView;
  }

  void login(String phone, String password) {
    _authController.login(_context, new Login(cellphone: phone, password: password)).then((value) => {
      this.user = value,
      _saveUserInfo(this.user),
    });
  }

  _saveUserInfo(User user) {
    _authController
        .registerUser(user)
        .then((success) => {_checkUserRegister(success)});
  }

  _checkUserRegister(bool success) {
    if (success) {
      _view.proceedToMenu();
    }
  }
}
