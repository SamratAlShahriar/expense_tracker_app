import 'package:expense_tracker_app/pages/add_expense_income_page.dart';
import 'package:expense_tracker_app/pages/analysis_page.dart';
import 'package:expense_tracker_app/pages/dashboard_page.dart';
import 'package:expense_tracker_app/pages/history_page.dart';
import 'package:expense_tracker_app/pages/loan_page.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:expense_tracker_app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        initialRoute: DashboardPage.routeName,
        theme: pocketTheme,
        routes: {
          DashboardPage.routeName: (context) => DashboardPage(),
          AddIncomeOrExpensePage.routeName: (context) =>
              AddIncomeOrExpensePage(),
          AnalysisPage.routeName: (context) => AnalysisPage(),
          LoanPage.routeName: (context) => LoanPage(),
          HistoryPage.routeName: (context) => HistoryPage(),
        },
      ),
    );
  }
}
