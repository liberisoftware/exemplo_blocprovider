import 'package:bytebank/database/database_connection.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/states/base_state_transferencia.dart';
import 'package:bytebank/screens/transferencia/states/initital_state_transferencia.dart';
import 'package:bytebank/screens/transferencia/states/list_loaded_state_transferencia.dart';
import 'package:bytebank/screens/transferencia/states/list_loading_state_transferencia.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferenciaBloc extends Cubit<BaseStateTransferencia> {
  List<Transferencia> _listaTransferencias = <Transferencia>[];

  TransferenciaBloc(): super(InitialStateTranferencia());

  void carregarLista() async {
    emit(ListLoadingStateTransferencia());

    _listaTransferencias = await DatabaseConnection.listAll();

    emit(ListLoadedStateTransferencia(_listaTransferencias));
  }


  adicionar(Transferencia item) {
    DatabaseConnection.save(item);
    this.carregarLista();
  }
}