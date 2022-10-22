import 'package:intl/intl.dart';

String formatDateTime(int dateTimeInt) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dateTimeInt);
  DateFormat dateFormat = DateFormat('hh:mm a');
  return dateFormat.format(dateTime);
}
