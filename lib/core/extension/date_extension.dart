import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String beautiful() {
    DateFormat dateFormat = DateFormat('y MMM d - hh:mm a');
    return dateFormat.format(this);
  }
}
