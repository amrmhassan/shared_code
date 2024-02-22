import 'package:flutter/material.dart';

class AppRoutes {
  static Future<T?> push<T extends Object?>(
    BuildContext context,
    Widget widget,
  ) {
    if (!context.mounted) return Future.value(null);

    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  static Future<T?> pushReplacement<T extends Object?>(
    BuildContext context,
    Widget widget,
  ) {
    if (!context.mounted) return Future.value(null);
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    Widget widget,
    RoutePredicate predicate,
  ) {
    if (!context.mounted) return Future.value(null);
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      predicate,
    );
  }

  static Future<T?> pushRemoveAllBefore<T extends Object?>(
    BuildContext context,
    Widget widget,
  ) {
    if (!context.mounted) return Future.value(null);
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );
  }

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (context.mounted) {
      return Navigator.pop(context, result);
    }
  }
}
