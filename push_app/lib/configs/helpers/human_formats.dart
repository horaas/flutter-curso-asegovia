import 'package:intl/intl.dart';

class HumanFormats {

  static String humanREadleNumber(double number, [int decimal = 0]) {
    final formaterNumber = NumberFormat.compactCurrency(
      decimalDigits: decimal,
      symbol: ''
    ).format(number);

    return formaterNumber;
  }

}