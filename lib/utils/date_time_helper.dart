import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime format() {
    // DATE AND TIME
    final now = DateTime.now();
    final dateFormat = DateFormat('y/M/d');
    const timeSpecific = '11:00:00';
    final completeFormate = DateFormat('y/M/d H:m:s');

    // TODAY FORMAT
    final todayDate = dateFormat.format(now);
    final todayDayandTime = '$todayDate $timeSpecific';
    var resultToday = completeFormate.parseStrict(todayDayandTime);

    // Tomorrow Format
    var formatted = resultToday.add(const Duration(days: 1));
    final tomorrowDate = dateFormat.format(formatted);
    final tomorrowDateAndTime = "$tomorrowDate $timeSpecific";
    var resultTomorrow = completeFormate.parseStrict(tomorrowDateAndTime);

    return now.isAfter(resultToday) ? resultTomorrow : resultToday;
  }
}
