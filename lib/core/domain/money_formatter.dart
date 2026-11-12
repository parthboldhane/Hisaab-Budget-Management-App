import 'package:intl/intl.dart';

String formatMoneyMinor(
  int amountMinor, {
  String currencyCode = 'INR',
  String locale = 'en_IN',
}) {
  if (!RegExp(r'^[A-Z]{3}$').hasMatch(currencyCode)) {
    throw ArgumentError.value(currencyCode, 'currencyCode', 'Use ISO 4217.');
  }
  final negative = amountMinor < 0;
  final absolute = amountMinor.abs();
  final majorUnits = NumberFormat.decimalPattern(locale)
      .format(absolute ~/ 100);
  final minorUnits = (absolute % 100).toString().padLeft(2, '0');
  final symbol = NumberFormat.simpleCurrency(
    name: currencyCode,
    locale: locale,
  ).currencySymbol;
  return '${negative ? '-' : ''}$symbol$majorUnits.$minorUnits';
}
