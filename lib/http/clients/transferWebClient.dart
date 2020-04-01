import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:http/http.dart';

import '../webClient.dart';

const String baseUrl =
    'http://192.168.15.12:8082/api-bytebank/api/v1/transfers';

class TransferWebClient {
  Future<List<Transfer>> findAll() async {
    final Response response = await client.get('$baseUrl/?desc=true&orderBy=id&page=0&pageSize=10')
        .timeout(Duration(seconds: 10));
    List<Transfer> transferList = _toTransfers(response);

    return transferList;
  }

  Future<Transfer> save(Transfer transfer) async {
    final Response response = await client
        .post('$baseUrl/',
        headers: {'Content-type': 'application/json'},
        body: jsonEncode(transfer.toJson()))
        .timeout(Duration(seconds: 10));

    return Transfer.fromJson(jsonDecode(response.body));
  }

  List<Transfer> _toTransfers(Response response) {
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    final List<Transfer> transferList = List();
    if (decodedJson['totalRegister'] > 0) {
      List<dynamic> decodedList = decodedJson['registers'];

      return decodedList.map((dynamic json) => Transfer.fromJson(json)).toList();
    }
    return transferList;
  }

}