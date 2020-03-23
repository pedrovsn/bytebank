import 'package:bytebank/components/byte_textfield.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _nicknameController = TextEditingController();

  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ByteTextField(
            _nicknameController,
            label: 'Nickname do contato',
            hint: 'nickymorim',
          ),
          ByteTextField(
            _valueController,
            label: 'Valor da transferência',
            hint: '100.00',
            iconData: Icons.monetization_on,
            textInputType: TextInputType.number,
          ),
          Container(
              child: RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              String username = _nicknameController.text;
              double value = double.tryParse(_valueController.text);

              if (username != null && value != null) {
                Transfer transfer = Transfer(value, username);
                Navigator.pop(context, transfer);
              }
            },
          ))
        ],
      ),
      appBar: AppBar(
        title: Text('Nova transferência'),
      ),
    );
  }
}
