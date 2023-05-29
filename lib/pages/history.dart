import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:tl_bank/models/transaction.dart';
import 'package:tl_bank/pages/receipt.dart';
import 'package:tl_bank/store/app.store.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: store.transactions.length,
        itemBuilder: (context, index) =>
            itemExtract(store.transactions[index], context),
      ),
    );
  }
}

Widget itemExtract(Transaction item, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => ReceiptPage(transaction: item)));
    },
    child: Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(
            width: 80,
            child: Center(
              child: Icon(
                LineIcons.alternateExchange,
                size: 34,
                color: Colors.deepOrange,
              ),
            ),
          ),
          Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Feito em:   ${item.dateFormatted()}'),
                  Text(
                    'R\$ ${item.amount.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 42),
                  ),
                  Text('Para: ${item.to}'),
                ]),
          )
        ],
      ),
    ),
  );
}
