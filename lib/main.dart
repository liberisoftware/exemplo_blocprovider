import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ByteBankApp());
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase cubit, Change change) {
    print("${cubit.runtimeType} > $change");
    super.onChange(cubit, change);
  }
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Bloc.observer = LogObserver();

    return MaterialApp(
      home: Scaffold(
        body: ListaTransferenciaContainer(),
      )
    );
  }
}
