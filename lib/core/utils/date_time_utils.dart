import 'package:intl/intl.dart';

int getNowUtcTimeInMinutes() {
  var now = DateTime.now().toUtc();
  return (now.hour * 60) + now.minute;
}

String getNowInEpochSeconds() {
  var now = DateTime.now().millisecondsSinceEpoch;
  print(now);
  int result = now ~/ 1000;
  print(result);
  return result.toString();
}

String getDateTimeFromEpochSeconds(String sec) {
  int seconds = int.parse(sec);
  var dateTime = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  return DateFormat('dd MMM yyyy hh:mm a').format(dateTime);
}

String getDDMMYYYFromEpoch(String sec) {
  int seconds = int.parse(sec);
  var dateTime = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  return DateFormat('dd-MM-yyyy').format(dateTime);
}

String getMMYYYFromEpoch(String sec) {
  int seconds = int.parse(sec);
  var dateTime = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  return DateFormat('MM-yyyy').format(dateTime);
}

String getYYYFromEpoch(String sec) {
  int seconds = int.parse(sec);
  var dateTime = DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  return DateFormat('yyyy').format(dateTime);
}

readableDateMMMDDYYYY(DateTime dateTime) {
  try {
    String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);
    return formattedDate;
  } catch (e) {
    return '';
  }
}

readableDateYYYYMMDD(DateTime dateTime) {
  try {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  } catch (e) {
    return '';
  }
}

String convertDateDDMMM(String date) {
  return DateFormat("dd MMM").format(DateTime.parse(date));
}