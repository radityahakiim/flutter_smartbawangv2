import 'package:intl/intl.dart';

String formatRupiah(double amount) {
  final formatter =
      NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 0);
  return formatter.format(amount);
}
