import 'package:intl/intl.dart';

class CurrencyUtils {
  const CurrencyUtils._();
  static String getBalance(
    double? val, {
    int? decimalDigits = 0,
    bool hasBalance = true,
  }) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'HI',
      name: '',
      decimalDigits: decimalDigits,
    );

    return "${hasBalance ? '₹ ' : ''}${currencyFormatter.format(val ?? 0)}";
  }
}
