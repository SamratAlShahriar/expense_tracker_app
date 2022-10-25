import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const datePattern = 'dd-MM-yyyy';
const dateTimePattern = 'dd-MM-yyyy hh:mm:s a';

String getFormattedDate(DateTime dateTime, String pattern) {
  return DateFormat(pattern).format(dateTime);
}

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));