import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const datePattern = 'yyyy-MM-dd';
const dateTimePattern = 'yyyy-MM-dd hh:mm:s a';

String getFormattedDate(DateTime dateTime, String pattern) {

  return DateFormat(pattern).format(dateTime);
}

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));