import 'package:intl/intl.dart';

class ScheduleItem {
  String scheduleName;
  DateTime scheduleTime;
  DateFormat _dateFormat = new DateFormat("HH:mm");
  bool isActive = false;
  bool willActive = false;

  ScheduleItem({this.scheduleName, this.scheduleTime});

  String getTimeStr() {
    return _dateFormat.format(scheduleTime);
  }
}