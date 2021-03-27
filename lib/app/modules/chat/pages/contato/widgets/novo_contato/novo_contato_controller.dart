import 'package:mobx/mobx.dart';

part 'novo_contato_controller.g.dart';

class NovoContatoController = _NovoContatoControllerBase
    with _$NovoContatoController;

abstract class _NovoContatoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
