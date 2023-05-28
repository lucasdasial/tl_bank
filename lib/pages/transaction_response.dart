import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:tl_bank/components/button.dart';
import 'package:tl_bank/pages/home.dart';

class TransactionResponse extends StatelessWidget {
  final bool isPositive;
  late String url;
  late String msg;
  TransactionResponse({super.key, required this.isPositive});

  @override
  Widget build(BuildContext context) {
    if (isPositive) {
      msg = 'Transferência feita com sucesso!';
      url = 'https://assets7.lottiefiles.com/packages/lf20_pqnfmone.json';
    } else {
      msg = 'Ação cancelada, saldo insuficiente';
      url = 'https://assets5.lottiefiles.com/packages/lf20_qpwbiyxf.json';
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(url, height: 250),
              Text(
                msg,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              button('Ok', () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => HomePage()),
                    (route) => false);
              })
            ],
          ),
        ),
      ),
    );
  }
}
