import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';

const SCREEN_TITLE = "Criando Transferências";

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController controllerFieldAccountNumber =
      new TextEditingController();
  final TextEditingController controllerFieldValue =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SCREEN_TITLE),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: controllerFieldAccountNumber,
                label: 'Número da conta',
                hint: '0000'),
            Editor(
              controller: controllerFieldValue,
              label: 'Valor',
              hint: '0000',
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () => createTransfer(context),
            )
          ],
        ),
      ),
    );
  }

  void createTransfer(BuildContext context) {
    final double? value = double.tryParse(controllerFieldValue.text);
    final int? account = int.tryParse(controllerFieldAccountNumber.text);
    if (value != null && account != null) {
      Navigator.pop(context, Transfer(value, account));
    }
  }
}
