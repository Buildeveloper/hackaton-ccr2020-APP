import 'package:mobx/mobx.dart';

part 'health_data_controller.g.dart';

class HealthDataController = _HealthDataControllerBase
    with _$HealthDataController;

abstract class _HealthDataControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
