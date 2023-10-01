import 'dart:html';

class Parceiro {
  final String categoria;
  final String nome;
  final String usuario;

  Parceiro({
    required this.categoria,
    required this.nome,
    required this.usuario,
  });

  factory Parceiro.fromJson(Map<String, dynamic> json) {
    
    return Parceiro(
      categoria: json['nome'] as String ?? '',
      nome: json['nome'] as String ?? '',
      usuario: json['nome'] as String ?? '',
    );
  }
}