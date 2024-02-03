import 'package:intl/intl.dart';

extension Date on DateTime {
  // format the date to be like this: 12:00 pm
  String toFormattedString() => DateFormat.jm().format(this);
}