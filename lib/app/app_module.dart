import 'package:ace/app/app_controller.dart';
import 'package:ace/app/modules/auth/auth_module.dart';
import 'package:ace/app/shared/auth/auth_controller.dart';
import 'package:ace/app/shared/network/ace/ace_api.dart';
import 'package:ace/app/shared/network/api.dart';
import 'package:ace/app/shared/repositories/storage/storage_manager.dart';
import 'package:ace/app/shared/repositories/storage/storage_manager_interface.dart';
import 'package:ace/app/shared/repositories/user/user_repository.dart';
import 'package:ace/app/shared/repositories/user/user_repository_interface.dart';
import 'package:ace/app/splash/splash_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ace/app/app_widget.dart';
import 'package:ace/app/modules/home/home_module.dart';
import 'package:ace/app/shared/constants/routes.dart' as Routes;

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthController()),
        Bind((i) => AppController()),
        Bind((i) => Dio()),
        Bind((i) => AceApi()),
        Bind((i) => Api()),
        Bind<IStorageManager>((i) => StorageManager()),
        Bind<IUserRepository>((i) => UserRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => SplashPage(), transition: TransitionType.scale),
        Router(Routes.HOME,
            module: HomeModule(), transition: TransitionType.scale),
        Router(Routes.LOGIN,
            module: AuthModule(), transition: TransitionType.scale),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
