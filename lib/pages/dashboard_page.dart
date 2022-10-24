import 'package:expense_tracker_app/pages/add_expense_income_page.dart';
import 'package:expense_tracker_app/themes/colors.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = '/dashboard';

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var chipType = "Expense";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFCFCFC),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          isExtended: true,
          onPressed: () {
            Navigator.pushNamed(context, AddIncomeOrExpensePage.routeName);
          },
        ),
        body: Column(
          children: [
            Card(
              elevation: 10.0,
              color: colorWhite,
              margin: EdgeInsets.all(20),
              shadowColor: Colors.white38,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 8),
                children: [
                  Card(
                    color: colorWhite,
                    elevation: 5,
                    shadowColor: colorBlack,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.analytics,
                              )),
                          Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: colorWhite,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.analytics,
                              )),
                          Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: colorWhite,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.analytics,
                              )),
                          Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: colorWhite,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.analytics,
                              )),
                          Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: colorWhite,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.analytics,
                              )),
                          Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: colorWhite,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.analytics,
                              )),
                          Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: colorWhite,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.analytics,
                              )),
                          Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: colorWhite,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.analytics,
                              )),
                          Text(
                            'Analytics',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ChoiceChip(
                  elevation: 1,
                  label: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Income',
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            chipType == 'Income' ? Colors.white : Colors.green,
                      ),
                    ),
                  ),
                  selected: chipType == 'Income' ? true : false,
                  backgroundColor: Colors.white70,
                  selectedColor: Colors.green,
                  onSelected: (value) {
                    setState(() {
                      chipType = 'Income';
                    });
                  },
                ),
                ChoiceChip(
                  elevation: 1,
                  label: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Expense',
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            chipType == 'Expense' ? Colors.white : Colors.green,
                      ),
                    ),
                  ),
                  selected: chipType == 'Expense' ? true : false,
                  backgroundColor: Colors.white70,
                  selectedColor: Colors.green,
                  onSelected: (value) {
                    setState(() {
                      chipType = 'Expense';
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_vert),
                label: 'More',
                activeIcon: Icon(Icons.abc_outlined)),
          ],
        ),
      ),
    );
  }
}
