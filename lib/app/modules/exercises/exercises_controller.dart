import 'package:mobx/mobx.dart';

part 'exercises_controller.g.dart';

class ExercisesController = _ExercisesControllerBase with _$ExercisesController;

abstract class _ExercisesControllerBase with Store {
    @observable
    int value = 0;
    
    @action
    void increment() {
        value++;
    }
}
