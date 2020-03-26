import 'dart:convert';

import 'package:bytebank/http/loggingInterceptor.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

Future<List<Transfer>> findAll() async {
  final Client client =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response = await client.get(
      'http://192.168.15.12:8082/api-bytebank/api/v1/transfers/?desc=true&orderBy=id&page=0&pageSize=10');
  final Map<String, dynamic> decodedJson = jsonDecode(response.body);
  final List<Transfer> transferList = List();
  if(decodedJson['totalRegister'] > 0) {
    for (Map<String, dynamic> element in decodedJson['registers']) {
      final Transfer transfer = Transfer(
          element['value'],
          Contact(element['contact']['name'], element['contact']['nickname'],
              id: 0));

      transferList.add(transfer);
    }
  }

  return transferList;
}
