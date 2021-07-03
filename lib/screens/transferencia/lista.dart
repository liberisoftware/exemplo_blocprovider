import 'package:bytebank/blocs/transferencia_bloc.dart';
import 'package:bytebank/components/bloc_container.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/states/base_state_transferencia.dart';
import 'package:bytebank/screens/transferencia/states/initital_state_transferencia.dart';
import 'package:bytebank/screens/transferencia/states/list_loaded_state_transferencia.dart';
import 'package:bytebank/screens/transferencia/states/list_loading_state_transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'formulario.dart';

class ListaTransferenciaContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransferenciaBloc>(
      create: (BuildContext context) {
        final cubit = TransferenciaBloc();
        cubit.carregarLista();
        return cubit;
      },
      child: ListaTransferencia(),
    );
  }
}

class ListaTransferencia extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tranferência')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push<Transferencia>(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          future.then((novaTransferencia) {
            debugPrint('$novaTransferencia');
            if (novaTransferencia != null) {
              BlocProvider.of<TransferenciaBloc>(context, listen: false).carregarLista();
            }
          });
         },
      ),
      body: BlocBuilder<TransferenciaBloc,BaseStateTransferencia>(
        builder: (context, state) {
          if (state is InitialStateTranferencia) {
            return const Text("...");
          }
          else if (state is ListLoadingStateTransferencia) {
            return const Text("Carregando...");
          }
          else if (state is ListLoadedStateTransferencia) {
            return ListView.builder(
              itemCount: state.lista.length,
              itemBuilder: (context, index) {
                Transferencia item = state.lista[index];

                return ItemListaTransferencia(item);
              }
            );
          }
          else {
            return const Text("Erro desconhecido");
          }
        }
      )
    );
  }
}

class ItemListaTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemListaTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return
      Card(
        child: ListTile(
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.conta.toString()),
          leading: Icon(Icons.monetization_on),
        )
      );
  }
}
