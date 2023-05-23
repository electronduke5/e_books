import 'package:intl/intl.dart';

class DateTimeHelper {
  static String getDate(DateTime date) => DateFormat('dd.MM.yyyy').format(date);
  static String getDateWithTime(DateTime date) => DateFormat('dd.MM.yyyy HH:mm').format(date);
}