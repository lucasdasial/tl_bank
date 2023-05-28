import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  double amount = 0.0;

  @action
  void deposit(double value) {
    amount = amount + value;
  }
}
