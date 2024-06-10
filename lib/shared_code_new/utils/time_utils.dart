// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

// import 'package:user_app/init/runtime_variables.dart';

class TimeUtils {
  static TimeOfDay addDurationToTime(TimeOfDay time, Duration duration) {
    int currentMinutes = time.hour * 60 + time.minute;
    Duration currentTimeAsDuration = Duration(minutes: currentMinutes);

    Duration newTime = currentTimeAsDuration + duration;

    int newHours = newTime.inHours;
    int newMinutes = newTime.inMinutes.remainder(60);

    return TimeOfDay(hour: newHours, minute: newMinutes);
  }
}
