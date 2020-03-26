import 'package:bytebank/http/transferWebClient.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransferList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransferListState();
  }
}

class _TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Transfer>>(
        future: findAll(),
        builder: (context, snapshot) {
          final List<Transfer> transfers = snapshot.data;

          switch(snapshot.connectionState) {

            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Carregando')
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              return ListView.builder(
                  itemCount: transfers.length,
                  itemBuilder: (context, index) {
                    final transfer = transfers[index];
                    return TransferItem(transfer);
                  });
          }
          return Text('Erro desconhecido');
        },
      ),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transfer> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
            // ignore: missing_return
          })).then((receivedTransfer) {
            setState(() {
//              widget._transfers.add(receivedTransfer);
            });
          });
        },
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.contact.name),
      ),
    );
  }
}
