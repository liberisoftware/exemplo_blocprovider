import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/database_connection.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _tecConta = TextEditingController();
  final TextEditingController _tecValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edição de Tranferência')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(controlador: _tecConta, label: 'Conta', hint: '0000'),
            Editor(controlador: _tecValor, label: 'Valor', hint: '0.00', icone: Icons.monetization_on),
            ElevatedButton(
              onPressed: () {
                _onPressedConfirmTransfer(context);
              },
              child: Text('Botão')
            )
          ],
        ),
      )
    );
  }

  void _onPressedConfirmTransfer(BuildContext context) {
      Transferencia novaTransferencia = new Transferencia(
        double.tryParse(_tecValor.text),
        int.tryParse(_tecConta.text)
      );

      DatabaseConnection.save(novaTransferencia).then((id) => Navigator.pop(context, novaTransferencia));
  }
}