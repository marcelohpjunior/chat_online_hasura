class UsuarioModel {
  int? idUsuario;
  String? email;
  String? senha;
  String? nome;
  String? sobrenome;
  String? telefone;

  UsuarioModel(
      {this.idUsuario,
      this.email,
      this.senha,
      this.nome,
      this.sobrenome,
      this.telefone});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json['id_usuario'];
    email = json['email'];
    senha = json['senha'];
    nome = json['nome'];
    sobrenome = json['sobrenome'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_usuario'] = this.idUsuario;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['nome'] = this.nome;
    data['sobrenome'] = this.sobrenome;
    data['telefone'] = this.telefone;
    return data;
  }
}
