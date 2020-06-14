import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  bool showFab = true;

  @action
  void changeFabVisibility(bool show) {
    this.showFab = show;
  }
}
