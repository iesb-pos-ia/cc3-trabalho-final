import 'package:mobx/mobx.dart';

part 'index_controller.g.dart';

class IndexController = _IndexControllerBase with _$IndexController;

abstract class _IndexControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
