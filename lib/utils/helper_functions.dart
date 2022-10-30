import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

const datePattern = 'yyyy-MM-dd';
const dateTimePattern = 'yyyy-MM-dd hh:mm:s a';

DateTime getPreviousDatetimeByDays({required int days}){
  DateTime dateTime = DateTime.now();
  return dateTime.subtract(Duration(days: days));
}

String getFormattedDate(DateTime dateTime, String pattern) {

  return DateFormat(pattern).format(dateTime);
}

void showMsg(BuildContext context, String msg) =>
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));

void showToastMsg(String msg){
  Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}