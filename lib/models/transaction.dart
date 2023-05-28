import 'package:intl/intl.dart';

class Transaction {
  String to;
  double amount;
  DateTime createdAt = DateTime.now();

  Transaction(
    this.to,
    this.amount,
  );

  String dateFormatted() {
    String formatted =
        DateFormat('E,d MMM yyyy HH:mm:ss', 'pt_BRL').format(createdAt);

    return formatted;
  }
}
