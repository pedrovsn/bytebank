class Contact {
  int id;
  String _name;
  String _nickname;

  Contact(this._name, this._nickname, {this.id});

  String get nickname => _nickname;

  String get name => _name;

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _nickname = json['nickname'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': _name,
    'nickname': _nickname
  };

  @override
  String toString() {
    return 'Contact{id: $id, _name: $_name, _nickname: $_nickname}';
  }
}
