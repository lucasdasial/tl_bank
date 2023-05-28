import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tl_bank/components/button.dart';
import 'package:tl_bank/components/input.dart';
import 'package:tl_bank/store/app.store.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Depositar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text(
            'Quanto deseja depositar?',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Observer(
            builder: (_) => Text(store.amount.toString()),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: inputText('Valor', 'R\$', amountController, () {}),
          ),
          button('continuar', () {
            FocusManager.instance.primaryFocus?.unfocus();

            if (amountController.text.isEmpty) {
              Fluttertoast.showToast(
                  textColor: Colors.red,
                  gravity: ToastGravity.TOP_RIGHT,
                  fontSize: 24,
                  toastLength: Toast.LENGTH_LONG,
                  msg: 'Para fazer deposito é nescessário inserir um valor!',
                  backgroundColor: Colors.red);
            } else {
              store.deposit(double.parse(amountController.text));

              Fluttertoast.showToast(
                  textColor: Colors.green,
                  gravity: ToastGravity.TOP_RIGHT,
                  fontSize: 24,
                  toastLength: Toast.LENGTH_LONG,
                  msg: 'Deposito feito com sucesso!',
                  backgroundColor: Colors.green);

              Navigator.pop(context);
            }
          }),
        ]),
      ),
    );
  }
}
