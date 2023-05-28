import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tl_bank/components/button.dart';
import 'package:tl_bank/components/input.dart';
import 'package:tl_bank/models/transaction.dart';
import 'package:tl_bank/pages/transaction_response.dart';
import 'package:tl_bank/store/app.store.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});

  final toController = TextEditingController();
  final amountController = TextEditingController();

  void handleMakeTransaction(BuildContext context, AppStore store) {
    FocusManager.instance.primaryFocus?.unfocus();

    if (amountController.text.isEmpty || toController.text.isEmpty) {
      Fluttertoast.showToast(
          textColor: Colors.red,
          gravity: ToastGravity.TOP_RIGHT,
          fontSize: 24,
          toastLength: Toast.LENGTH_LONG,
          msg: 'Preencha todos os campos para transferir!',
          backgroundColor: Colors.red);
    } else {
      double value = double.parse(amountController.text);

      Transaction transaction = Transaction(toController.text, value);

      bool isProcessed = store.makeTransition(value);

      isProcessed ? store.addOne(transaction) : null;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TransactionResponse(isPositive: isProcessed),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferir'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: const Text(
                'Para quem irar transferir?',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            inputText('Destinatário', '', toController, () {},
                type: TextInputType.text),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: const Text(
                'Nome e sobrenome, CPF ou numero da conta',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: inputText('Valor', '', amountController, () {}),
            ),
            button('Transferir', () {
              handleMakeTransaction(context, store);
            })
          ],
        ),
      ),
    );
  }
}
