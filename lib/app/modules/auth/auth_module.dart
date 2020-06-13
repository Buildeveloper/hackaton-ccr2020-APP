import 'package:ace/app/modules/auth/login_controller.dart';
import 'package:ace/app/modules/auth/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginController()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => LoginPage())
  ];

  static Inject get to => Inject<AuthModule>.of();
}
