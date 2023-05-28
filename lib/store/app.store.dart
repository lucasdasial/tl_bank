import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:tl_bank/models/transaction.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  double amount = 0.0;

  @observable
  List<Transaction> transactions = [
    Transaction('ifood', 39.9),
    Transaction('shop', 119.9)
  ];

  @action
  void deposit(double value) {
    amount = amount + value;
  }

  @action
  bool makeTransition(double value) {
    if (value <= amount) {
      amount = amount - value;
      return true;
    } else {
      return false;
    }
  }

  @action
  void addOne(Transaction t) {
    transactions.add(t);
  }
}
