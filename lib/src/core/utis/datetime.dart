import 'package:easy_localization/easy_localization.dart';

class DateTimeUtil {
  static String formatDateToString(DateTime? date,
      {String parttern = 'dd/MM/yyyy', String? locale}) {
    if (date == null) return '';
    return DateFormat(parttern, locale).format(date);
  }

  static String formatDateNow({String parttern = 'dd/MM/yyyy'}) {
    return formatDateToString(DateTime.now(), parttern: parttern);
  }

  static String durationToString(int? durationInMinutes) {
    if (durationInMinutes == null) return '';
    final int hours = durationInMinutes ~/ 60;
    final int minutes = durationInMinutes % 60;
    final String cinemaHoursTime = (hours > 0) ? '${hours}giờ ' : '';
    final String cinemaMinutesTime = (minutes > 0) ? '${minutes}phút' : '';
    return '$cinemaHoursTime$cinemaMinutesTime';
  }

  static String formatDurationAndCinemaDate({
    int? durationInMinutes,
    DateTime? dateTime,
  }) {
    final durationString = durationToString(durationInMinutes);
    final formatDateString = formatDateToString(dateTime, parttern: "d 'Thg' M, yyyy", locale: 'vi_VN');
    return '$durationString $formatDateString';
  }
}
