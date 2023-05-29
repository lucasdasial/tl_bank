import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tl_bank/components/button.dart';
import 'package:tl_bank/models/transaction.dart';
import 'package:share_plus/share_plus.dart';

class ReceiptPage extends StatelessWidget {
  Transaction transaction;

  ReceiptPage({super.key, required this.transaction});

  void handleShare() {
    Share.share(
        'Valor da transação R\$ ${transaction.amount.toStringAsFixed(2)}, enviado para ${transaction.to}, realizado em: ${transaction.dateFormatted()}',
        subject: 'Comprovante');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comprovante'),
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          children: [
            receiptCard(transaction),
            button('Compartilhar', () {
              handleShare();
            })
          ],
        ),
      )),
    );
  }
}

Widget receiptCard(Transaction transaction) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    color: Colors.white,
    width: double.infinity,
    height: 300,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Icon(LineIcons.receipt, size: 48, color: Colors.deepOrange),
      Container(
        margin: const EdgeInsets.only(top: 16),
        child: Text(
          ' R\$${transaction.amount.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 16),
        child: Text(
          'Destinatário: ${transaction.to}',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 16),
        child: Text(
          ' ${transaction.dateFormatted()}',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    ]),
  );
}
