import 'package:expense_tracker_app/pages/add_expense_income_loan_page.dart';
import 'package:expense_tracker_app/pages/analysis_page.dart';
import 'package:expense_tracker_app/pages/auth/login_page.dart';
import 'package:expense_tracker_app/pages/dashboard_page.dart';
import 'package:expense_tracker_app/pages/history_page.dart';
import 'package:expense_tracker_app/pages/home_page.dart';
import 'package:expense_tracker_app/pages/launcher_page.dart';
import 'package:expense_tracker_app/pages/loan_page.dart';
import 'package:expense_tracker_app/pages/profile_page.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:expense_tracker_app/providers/user_provider.dart';
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
        ChangeNotifierProvider(create: (context) => UserProvider(),),
      ],
      child: MaterialApp(
        initialRoute: LauncherPage.routeName,
        theme: pocketTheme,
        routes: {
          LauncherPage.routeName: (context) => LauncherPage(),
          LoginPage.routeName: (context) => LoginPage(),
          Homepage.routeName: (context) => Homepage(),
          ProfilePage.routeName: (context) => ProfilePage(),
          // DashboardPage.routeName: (context) => DashboardPage(),
          AddIncomeOrExpenseOrLoanPage.routeName: (context) =>
              AddIncomeOrExpenseOrLoanPage(),
          AnalysisPage.routeName: (context) => AnalysisPage(),
          LoanPage.routeName: (context) => LoanPage(),
          HistoryPage.routeName: (context) => HistoryPage(),
        },
      ),
    );
  }
}
