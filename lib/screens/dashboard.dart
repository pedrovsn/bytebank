import 'package:bytebank/screens/contacts/list.dart';
import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/bytebank_logo.png'),
          ),
          Row(
            children: <Widget>[
              _FeatureItem('Contacts', iconData: Icons.people, onTap: () => {
                _showContactList(context)
              },),
              _FeatureItem('History', iconData: Icons.history, onTap: () => {
                _showHistory(context)
              },)
            ],
          )
        ],
      ),
    );
  }

  _showContactList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactList()));
  }

  _showHistory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransferList()));
  }
}

class _FeatureItem extends StatelessWidget {
  final String _title;
  final IconData iconData;
  final Function onTap;

  _FeatureItem(this._title, { this.iconData, this.onTap });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            if(onTap != null) {
              onTap();
            }
          },
          child: Container(
            height: 100,
            width: 180,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    iconData != null ? iconData : Icons.adb ,
                    color: Colors.white,
                    size: 24,
                  ),
                  Text(
                    '$_title',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

