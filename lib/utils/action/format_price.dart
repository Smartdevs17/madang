import 'package:intl/intl.dart';

String formatPrice(int price) {
  final formatter = NumberFormat('#,##0', 'en_US');
  return '#${formatter.format(price)}';
}
