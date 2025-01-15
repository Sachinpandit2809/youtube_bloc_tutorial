import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  static void flushErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          titleColor: Colors.white,
          messageColor: Colors.white,
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }

  static void flushSuccessMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(
            Icons.check_circle_outline_outlined,
            size: 28,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          titleColor: Colors.white,
          messageColor: Colors.white,
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }
}
