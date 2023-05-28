import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tl_bank/pages/deposit.dart';
import 'package:tl_bank/pages/price_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final double amount = 200.69;

  onOpenPricePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PricePage(),
      ),
    );
  }

  onOpenDepositPage(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DepositPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bem vindo!',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Text(
                        'R\$ ${amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      const Icon(
                        LineIcons.coins,
                        size: 28,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        homeOptionButton(
                            'Transferir', 'alternateExchange', () {}, context),
                        homeOptionButton('Depositar', 'donate', () {
                          onOpenDepositPage(context);
                        }, context)
                      ],
                    ),
                    Column(
                      children: [
                        homeOptionButton(
                            'Extrato', 'fileInvoice', () {}, context),
                        homeOptionButton('Cotação', 'searchDollar', () {
                          onOpenPricePage(context);
                        }, context)
                      ],
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

Widget homeOptionButton(
    String label, String iconName, Function action, BuildContext ctx) {
  return Container(
    margin: const EdgeInsets.only(top: 24),
    child: InkWell(
      onTap: () {
        action();
      },
      child: Ink(
        height: MediaQuery.of(ctx).size.width * 0.40,
        width: MediaQuery.of(ctx).size.width * 0.40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LineIcons.values[iconName],
              size: 34,
              color: Colors.deepOrange,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    ),
  );
}
