import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';

const SCREEN_TITLE = "Transferências";

class TransferList extends StatefulWidget {
  final List<Transfer> list = [Transfer(100.0, 1)];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.list.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(SCREEN_TITLE),
      ),
      body: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          final Transfer transfer = widget.list[index];
          return TransferItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          ).then((transfer) => updateList(transfer, context));
        },
      ),
    );
  }

  void updateList(transfer, BuildContext context) {
    if (transfer != null) {
      setState(() {
        widget.list.add(transfer);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$transfer'),
          ),
        );
      });
    }
  }
}

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  const TransferItem(this.transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this.transfer.value.toString()),
        subtitle: Text(this.transfer.account.toString()),
      ),
    );
  }
}
