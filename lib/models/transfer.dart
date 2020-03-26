import 'package:bytebank/models/contact.dart';

class Transfer {
  final double _value;
  final Contact _contact;

  Transfer(this._value, this._contact);

  get value => this._value;

  get contact => this._contact;
}
