// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum SnackBarType {
  info,
  error,
  success,
}

class GlobalUtils {
  final GlobalKey<NavigatorState>? navigatorKey;
  const GlobalUtils({
    this.navigatorKey,
  });

  void showSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    SnackBarType? snackBarType,
    bool aboveBottomNavBar = false,
    EdgeInsets? margin,
    VoidCallback? onActionTapped,
    String? actionString,
  }) {
    try {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          behavior: aboveBottomNavBar ? SnackBarBehavior.floating : null,
          content: Text(
            message,
          ),
          backgroundColor: backgroundColor ??
              ((snackBarType ?? SnackBarType.info) == SnackBarType.success
                  ? Colors.green
                  : (snackBarType ?? SnackBarType.info) == SnackBarType.error
                      ? Colors.red
                      : null),
          margin: margin,
          action: SnackBarAction(
            label: actionString ?? 'Done',
            textColor: textColor ??
                ((snackBarType ?? SnackBarType.info) == SnackBarType.error ||
                        (snackBarType ?? SnackBarType.info) ==
                            SnackBarType.success ||
                        (snackBarType ?? SnackBarType.info) == SnackBarType.info
                    ? Colors.white
                    : null),
            onPressed: onActionTapped ?? () {},
          ),
        ),
      );
    } catch (e) {
      //
    }
  }

  void fastSnackBar({
    required String msg,
    SnackBarType? snackBarType,
    GlobalKey<NavigatorState>? navKey,
  }) {
    BuildContext? ctx = (navKey ?? navigatorKey)?.currentContext;
    if (ctx == null) return;
    showSnackBar(
      context: ctx,
      message: msg,
      snackBarType: snackBarType,
    );
  }

  void errorSnackbar(Object msg) {
    BuildContext? ctx = (navigatorKey)?.currentContext;
    if (ctx == null) return;
    showSnackBar(
      context: ctx,
      message: msg.toString(),
      snackBarType: SnackBarType.error,
    );
  }

  void infoSnackbar(String msg) {
    BuildContext? ctx = (navigatorKey)?.currentContext;
    if (ctx == null) return;
    showSnackBar(
      context: ctx,
      message: msg,
      snackBarType: SnackBarType.info,
    );
  }

  void successSnackbar(String msg) {
    BuildContext? ctx = (navigatorKey)?.currentContext;
    if (ctx == null) return;
    showSnackBar(
      context: ctx,
      message: msg,
      snackBarType: SnackBarType.success,
    );
  }

  String formatDuration(Duration d) {
    var seconds = d.inSeconds;
    final days = seconds ~/ Duration.secondsPerDay;
    seconds -= days * Duration.secondsPerDay;
    final hours = seconds ~/ Duration.secondsPerHour;
    seconds -= hours * Duration.secondsPerHour;
    final minutes = seconds ~/ Duration.secondsPerMinute;
    seconds -= minutes * Duration.secondsPerMinute;

    final List<String> tokens = [];
    if (days != 0) {
      tokens.add('$days day${putS(days)}');
    }
    if (tokens.isNotEmpty || hours != 0) {
      tokens.add('$hours hour${putS(hours)}');
    }
    if (tokens.isNotEmpty || minutes != 0) {
      tokens.add('$minutes minute${putS(minutes)}');
    }
    tokens
        .add('${seconds < 10 ? '0$seconds' : seconds} second${putS(seconds)}');

    return tokens.join(' ');
  }

  String fromDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) {
        return "$n";
      }
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  String putS(int n, [bool capital = false]) {
    if (n > 1) {
      return capital ? 'S' : 's';
    } else {
      return '';
    }
  }

  T? stringToEnum<T>(String value, List<T> enumValues) {
    for (var enumValue in enumValues) {
      if (enumValue.toString().split('.').last == value) {
        return enumValue;
      }
    }

    return null;
  }

  Future<T> measureTime<T>(String tag, FutureOr<T> Function() callback) async {
    DateTime before = DateTime.now();
    var res = await callback();
    DateTime after = DateTime.now();
    if (kDebugMode) {
      print('$tag- Time taken ${after.difference(before).inMilliseconds} ms');
    }

    return res;
  }
}
