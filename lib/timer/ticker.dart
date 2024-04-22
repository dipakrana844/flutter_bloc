import 'package:flutter_bloc_test/config/constant.dart';

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    printLog("Ticker ticks", ticks);
    return Stream.periodic(const Duration(seconds: 1), (x) {
      printLog("Ticker x", x);
      return ticks - x - 1;
    }).take(ticks);
  }
}
