class Contact {
  int id;
  String _name;
  String _nickname;

  Contact(this._name, this._nickname, {this.id});

  String get nickname => _nickname;

  String get name => _name;
}