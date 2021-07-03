import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/states/base_state_transferencia.dart';
import 'package:flutter/material.dart';

@immutable
class ListLoadedStateTransferencia extends BaseStateTransferencia {
  final List<Transferencia> lista;

  ListLoadedStateTransferencia(this.lista);
}