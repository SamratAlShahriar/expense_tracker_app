import 'package:expense_tracker_app/pages/dashboard_page.dart';
import 'package:expense_tracker_app/pages/history_page.dart';
import 'package:expense_tracker_app/themes/colors.dart';
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
            Navigator.pushNamed(context, AddIncomeOrExpenseOrLoanPage.routeName)
                .then((value) => setState(() {}));
          },
        ),
        bottomNavigationBar: BottomAppBar(
          //bottom navigation bar on scaffold
          color: colorBlueDark,
          shape: CircularNotchedRectangle(),
          //shape of notch
          notchMargin: 5,
          //notche margin between floating button and bottom appbar
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.dashboard,
                  color:
                      _bottomNavCurrentIndex == 0 ? Colors.white : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _bottomNavCurrentIndex = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person_pin,
                  color:
                      _bottomNavCurrentIndex == 1 ? Colors.white : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _bottomNavCurrentIndex = 1;
                  });
                },
              ),
            ],
          ),
        ),
        body: homeList[_bottomNavCurrentIndex],
      ),
    );
  }
}
