import 'package:intl/intl.dart';

String formatPrice(dynamic price) {
  final formatter = NumberFormat('#,##0', 'en_US');
  return '#${formatter.format(price)}';
}
