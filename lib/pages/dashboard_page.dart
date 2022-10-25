import 'package:expense_tracker_app/custom_widgets/dashboard_page_button.dart';
import 'package:expense_tracker_app/pages/add_expense_income_page.dart';
import 'package:expense_tracker_app/pages/analysis_page.dart';
import 'package:expense_tracker_app/themes/colors.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard_page';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            CircleAvatar(
              child: Icon(Icons.person),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          isExtended: true,
          onPressed: () {
            Navigator.pushNamed(context, AddIncomeOrExpensePage.routeName);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.0,
              ),
              //welcome user text
              Row(
                children: [
                  Text(
                    'Welcome, ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'Samrat Al Shahriar',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),

              SizedBox(
                height: 8.0,
              ),

              //dashboard card for income expense and loan
              SizedBox(
                height: 150.0,
                child: Card(
                  elevation: 5.0,
                  shadowColor: Colors.black,
                  child: Row(
                    children: [],
                  ),
                ),
              ),

              SizedBox(
                height: 8.0,
              ),

              //dashboard navigate button
              SizedBox(
                height: 100.0,
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardButtonForDashboard(
                      btnTxt: "Loan",
                      btnIcon: Icons.monetization_on_outlined,
                      btnIconBgColor: Colors.orange,
                      btnBgColor: Colors.red,
                      btnOnClickRoute: AnalysisPage.routeName,
                    ),
                    CardButtonForDashboard(
                      btnTxt: "History",
                      btnIcon: Icons.history,
                      btnIconBgColor: Colors.orange,
                      btnBgColor: Colors.green,
                      btnOnClickRoute: AnalysisPage.routeName,
                    ),
                    CardButtonForDashboard(
                      btnTxt: 'ANALYSIS',
                      btnIcon: Icons.analytics,
                      btnIconBgColor: Colors.orange,
                      btnBgColor: Colors.deepPurple,
                      btnOnClickRoute: AnalysisPage.routeName,
                    ),
                  ],
                ),
              ),

              //recent history of transactions
              SizedBox(
                height: 8.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent History',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        children: List.generate(
                            14,
                            (index) => ListTile(
                                  leading:
                                      Icon(Icons.share_arrival_time_outlined),
                                  title: Text('Tilegle'),
                                  subtitle: Text('sublagjrt'),
                                  trailing: Text('12 .55 .65852 '),
                                )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
