//import 'package:ace/app/shared/models/body/login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ace/app/shared/models/user/user.dart';
import 'package:ace/app/shared/repositories/user/user_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IUserRepository _userRepository = Modular.get();

  Future<bool> logoutUser() => _userRepository.logoutUser();

  Future<bool> registerLogin() => _userRepository.registerLogin();

  Future<bool> registerUser(User user) => _userRepository.registerUser(user);

  Future<bool> isUserLogged() => _userRepository.isUserLogged();

  Future<User> getLoggedUser() => _userRepository.getLoggedUser();

//  Future<User> login(BuildContext context, Login login) =>
//      _userRepository.login(context, login);
}
