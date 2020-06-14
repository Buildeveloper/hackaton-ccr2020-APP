import 'package:ace/app/modules/register/pages/health_data/health_data_page.dart';
import 'package:ace/app/modules/register/pages/personal_data/personal_data_controller.dart';
import 'package:ace/app/modules/register/pages/personal_data/personal_data_page.dart';
import 'package:ace/app/modules/register/pages/sign_up_info/sign_up_info_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/health_data/health_data_controller.dart';
import 'pages/sign_up_info/sign_up_info_controller.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HealthDataController()),
        Bind((i) => SignUpInfoController()),
        Bind((i) => PersonalDataController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SignUpInfoPage()),
        Router("/personal_data", child: (_, args) => PersonalDataPage()),
        Router("/health_data", child: (_, args) => HealthDataPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
