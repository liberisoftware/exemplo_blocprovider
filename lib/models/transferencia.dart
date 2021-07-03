class Transferencia {
  final double? valor;
  final int? conta;

  Transferencia(this.valor, this.conta);

  @override
  String toString() {
    return '{conta:$conta, valor: $valor}';
  }
}