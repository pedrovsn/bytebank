import 'package:bytebank/components/byte_textfield.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final ContactDAO _dao = ContactDAO();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo contato'),
      ),
      body: Column(
        children: <Widget>[
          ByteTextField(
            _usernameController,
            label: 'Nome do usuário',
            hint: 'Nicole',
          ),
          ByteTextField(
            _nicknameController,
            label: 'Nickname',
            hint: 'nickymorim',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text('Create'),
                onPressed: () {
                  final String name = _usernameController.text;
                  final String nickname = _nicknameController.text;

                  _dao
                      .save(Contact(name, nickname))
                      .then((id) => Navigator.pop(context));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
