import 'package:bytebank/models/contact.dart';

class Transfer {
  final double _value;
  final Contact _contact;

  Transfer(this._value, this._contact);

  get value => this._value;

  get contact => this._contact;

  Transfer.fromJson(Map<String, dynamic> json)
      : _value = json['value'],
        _contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
    'value': _value,
    'contact': _contact.toJson()
  };

  @override
  String toString() {
    return 'Transfer{_value: $_value, _contact: $_contact}';
  }
}
