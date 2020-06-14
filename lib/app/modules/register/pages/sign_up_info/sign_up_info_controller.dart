import 'package:mobx/mobx.dart';

part 'sign_up_info_controller.g.dart';

class SignUpInfoController = _SignUpInfoControllerBase
    with _$SignUpInfoController;

abstract class _SignUpInfoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
