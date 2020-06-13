import 'package:mobx/mobx.dart';

part 'personal_data_controller.g.dart';

class PersonalDataController = _PersonalDataControllerBase
    with _$PersonalDataController;

abstract class _PersonalDataControllerBase with Store {
  @observable
  bool proceedEnabled = false;

  @action
  setProceedEnabled(bool enabled) {
    this.proceedEnabled = enabled;
  }
}
