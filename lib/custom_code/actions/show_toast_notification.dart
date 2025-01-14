// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

ElegantNotification createNotification(
  String type,
  String message,
  BuildContext context,
) {
  final toastDuration = Duration(seconds: 7);
  final double toastHeight = 50;
  final double screenWidth = MediaQuery.of(context).size.width;

  double toastWidth;
  if (screenWidth < 600) {
    // Mobile
    toastWidth = screenWidth * 0.9;
  } else if (screenWidth >= 600 && screenWidth < 1024) {
    // Tablette
    toastWidth = screenWidth * 0.6;
  } else {
    // Desktop ou grands écrans
    toastWidth = screenWidth * 0.4;
  }

  final double iconSize = 30;
  final double fontSize = 14;

  IconData iconData;
  Color color;
  Color textColor = Colors.black;

  switch (type) {
    case 'success':
      iconData = Icons.check_circle;
      color = Colors.green;
      break;
    case 'warning':
      iconData = Icons.report_problem;
      color = Colors.orange;
      break;
    case 'error':
      iconData = Icons.error;
      color = Colors.red;
      break;
    default:
      iconData = Icons.info;
      color = Colors.blue;
      break;
  }

  return ElegantNotification(
    description: Text(
      message,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
      ),
    ),
    toastDuration: toastDuration,
    progressIndicatorColor: color,
    height: toastHeight,
    width: toastWidth,
    animation: AnimationType.fromTop,
    background: Colors.white,
    borderRadius: BorderRadius.circular(10),
    icon: Icon(iconData, color: color, size: iconSize),
  );
}

Future showToastNotification(
  BuildContext context,
  String message,
  String? notificationType,
) async {
  ElegantNotification notification = createNotification(
    notificationType ?? 'info',
    message,
    context, // Passe le context ici pour calculer la largeur de l'écran
  );

  notification.show(context);
}
