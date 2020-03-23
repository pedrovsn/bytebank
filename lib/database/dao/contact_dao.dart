import 'package:bytebank/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDAO {
  static const String tableSql = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'nickname TEXTDATE)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();

    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['nickname'] = contact.nickname;

    return db.insert('contacts', contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    final List<Contact> contactList = List();

    for (Map<String, dynamic> row in result) {
      Contact contact = Contact(row['name'], row['nickname'], id: row['id']);
      contactList.add(contact);
    }

    return contactList;
  }
}