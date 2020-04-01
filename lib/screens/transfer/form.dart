import 'package:bytebank/components/byte_textfield.dart';
import 'package:bytebank/http/clients/transferWebClient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  final Contact contact;

  TransferForm(this.contact);

  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController _valueController = TextEditingController();
  final TransferWebClient _transferWebClient = TransferWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(
            widget.contact.name,
            style: TextStyle(
              fontSize: 24
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.contact.name,
              style: TextStyle(
                  fontSize: 32
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ByteTextField(
              _valueController,
              label: 'Value',
              hint: '100',
            ),
          ),
          Container(
              child: RaisedButton(
            child: Text('Confirm'),
            onPressed: () {
              double value = double.tryParse(_valueController.text);

              if (value != null) {
                Transfer transfer = Transfer(value, widget.contact);
                _transferWebClient.save(transfer).then((saved) {
                  if(saved != null){
                    Navigator.pop(context);
                  }else {

                  }
                });
              }
            },
          ))
        ],
      ),
      appBar: AppBar(
        title: Text('New transfer'),
      ),
    );
  }
}
