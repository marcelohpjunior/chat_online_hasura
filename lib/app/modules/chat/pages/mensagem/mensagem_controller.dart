import 'package:mobx/mobx.dart';

part 'mensagem_controller.g.dart';

class MensagemController = _MensagemControllerBase with _$MensagemController;

abstract class _MensagemControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
