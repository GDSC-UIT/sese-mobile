import 'package:intl/intl.dart';

class Utils {
  //
}

extension NumToMoney on num {
  String money(String symbol) =>
      NumberFormat.currency(locale: 'vi_vn', symbol: symbol).format(this);
  String get readable => NumberFormat.decimalPattern().format(this);
}
