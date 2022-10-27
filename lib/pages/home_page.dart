import 'package:expense_tracker_app/pages/dashboard_page.dart';
import 'package:expense_tracker_app/pages/history_page.dart';
import 'package:flutter/material.dart';

import 'add_expense_income_loan_page.dart';

class Homepage extends StatefulWidget {
  static const String routeName = '/home_page';

  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _bottomNavCurrentIndex = 0;

  var homeList = [DashboardPage(), HistoryPage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          isExtended: true,
          onPressed: () {
            Navigator.pushNamed(context, AddIncomeOrExpenseOrLoanPage.routeName);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavCurrentIndex,
          onTap: (index) {
            setState(() {
              _bottomNavCurrentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_vert),
              label: 'More',
              activeIcon: Icon(Icons.abc_outlined),
            ),
          ],
        ),
        body: homeList[_bottomNavCurrentIndex],
      ),
    );
  }
}
