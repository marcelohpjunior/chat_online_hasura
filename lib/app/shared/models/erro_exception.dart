class ErroException {
  String? _mensagem;

  get mensagem => this._mensagem;

  ErroException([this._mensagem = "Ocorreu um erro inesperado!"]);

  @override
  String toString() {
    return mensagem;
  }
}
