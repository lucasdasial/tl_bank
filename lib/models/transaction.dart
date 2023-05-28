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
    String formatted = DateFormat(
      'dd/MM/yyy HH:mm:ss',
    ).format(createdAt);

    return formatted;
  }
}
