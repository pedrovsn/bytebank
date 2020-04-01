import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/http/clients/transferWebClient.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransferList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransferListState();
  }
}

class _TransferListState extends State<TransferList> {
  final TransferWebClient _transferWebClient = TransferWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Transfer>>(
        future: _transferWebClient.findAll(),
        builder: (context, snapshot) {
          final List<Transfer> transfers = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (transfers.isNotEmpty) {
                  return ListView.builder(
                      itemCount: transfers.length,
                      itemBuilder: (context, index) {
                        final transfer = transfers[index];
                        return TransferItem(transfer);
                      });
                }
              }
              return CenteredMessage(
                'No transactions found',
                icon: Icons.warning,
              );
          }
          return CenteredMessage('Unknow error');
        },
      ),
      appBar: AppBar(
        title: Text('Transfers'),
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
