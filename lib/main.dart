import 'package:expense_tracker_app/pages/add_expense_income_page.dart';
import 'package:expense_tracker_app/pages/dashboard_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyPocket());
}

class MyPocket extends StatefulWidget {
  const MyPocket({Key? key}) : super(key: key);

  @override
  State<MyPocket> createState() => _MyPocketState();
}

class _MyPocketState extends State<MyPocket> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Dashboard.routeName,
      routes: {
        Dashboard.routeName: (context) => Dashboard(),
        AddIncomeOrExpensePage.routeName: (context) => AddIncomeOrExpensePage(),
      },
    );
  }
}
