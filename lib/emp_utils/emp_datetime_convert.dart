import 'package:intl/intl.dart';

class EmpDateTimeConvert {
  //May 16, 2023 . 12:25:00

  static String formatedDate(d) {
    String formattedDate = DateFormat('MMM dd, yyyy').format(DateTime.parse(d));
    return formattedDate;
  }

  static String formatedTime(d) {
    String time = DateFormat('hh:mm:ss').format(DateTime.parse(d));
    return time;
  }

  static DateTime stirngToDate(String d) {
    DateTime time = DateFormat("dd/M/yyyy").parse(d);
    return time;
  }

  static String getDateAndTimeFromTimeStamp(int ts) {
    final df = DateFormat('d MMM, yyyy');
    if (ts != 0) {
      // String convertedDate = df.format(DateTime.fromMillisecondsSinceEpoch(ts * 1000));
      String convertedDate = df.format(getDateTimeFromTimeStamp(ts));
      return convertedDate;
    } else {
      return ' 0 ';
    }
  }

  static DateTime getDateTimeFromTimeStamp(int ts) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
    // print('getDateFromfTimeStamp => timeStamp : $ts');
    return date;
  }

  static int getTimeStampFromDate(DateTime date) {
    int timeStamp = date.millisecondsSinceEpoch;
    print('getTimeStampFromDate => timeStamp : $timeStamp');
    return timeStamp;
  }

  static String getFormateDate(int d) {
    DateTime dt = getDateTimeFromTimeStamp(d);
    String formattedDate = DateFormat('d MMM yyyy').format(dt);
    return formattedDate;
  }

  static int getDateInSeconds(int days, bool isStartDate) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String date = "";
    if (isStartDate) {
      date = "$formattedDate 12:00:00";
    } else {
      date = "$formattedDate 23:59:59";
    }
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    int dateInSecs = (tempDate.toLocal().millisecondsSinceEpoch / 1000).round();
    return dateInSecs - (86400 * days);
  }

  // static String formatDate(d) {
  //   DateTime dateTime = DateTime.now();
  //   String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);
  //   String time = DateFormat('hh:mm:ss').format(dateTime);
  //   print(formattedDate); // Output: 2023-06-22
  //   return "$formattedDate • $time";
  // }
}
