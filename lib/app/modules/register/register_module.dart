import 'package:ace/app/modules/register/pages/personal_data/personal_data_controller.dart';
import 'package:ace/app/modules/register/pages/personal_data/personal_data_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ace/app/shared/constants/routes.dart' as Routes;

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PersonalDataController()),
      ];

  @override
  List<Router> get routers => [
        Router("/personal_data", child: (_, args) => PersonalDataPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
