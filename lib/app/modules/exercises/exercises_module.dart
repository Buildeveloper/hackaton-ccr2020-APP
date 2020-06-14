import 'package:ace/app/modules/exercises/exercises_controller.dart';
import 'package:ace/app/modules/exercises/exercises_page.dart';
import 'package:ace/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ace/app/modules/home/home_page.dart';

class ExercisesModule extends ChildModule {
    @override
    List<Bind> get binds => [
        Bind((i) => ExercisesController()),
    ];
    
    @override
    List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ExercisesPage()),
    ];
    
    static Inject get to => Inject<ExercisesModule>.of();
}
