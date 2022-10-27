import 'package:expense_tracker_app/constants/const_strings.dart';
import 'package:expense_tracker_app/custom_widgets/dashboard_page_button.dart';
import 'package:expense_tracker_app/custom_widgets/dashboard_page_top_cards.dart';
import 'package:expense_tracker_app/custom_widgets/history_listview_single_item.dart';
import 'package:expense_tracker_app/pages/analysis_page.dart';
import 'package:expense_tracker_app/pages/history_page.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/transaction_model.dart';
import '../themes/colors.dart';
import 'loan_page.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard_page';

  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late TransactionProvider transactionProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    transactionProvider.getAllTransactionsList(1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //top side
          Container(
            decoration: BoxDecoration(
              color: colorBlueDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 16.0,
                ),
                //welcome user text
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_balance_wallet, color: Color(
                          0x5f03032F),),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        '15358614.0',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: colorBlueDark,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.0,),

                //dashboard card for income expense and loan
                SizedBox(
                  height: 120.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: DashboardCardGenerator(
                            cardType: 'Income',
                            imagePath: 'assets/images/income.png',
                            iconColor: Colors.green,
                            cardAmount: '100999'),
                      ),
                      Expanded(
                        flex: 1,
                        child: DashboardCardGenerator(
                            cardType: 'Expense',
                            imagePath: 'assets/images/expense.png',
                            iconColor: Colors.red,
                            cardAmount: '100000'),
                      ),
                      Expanded(
                        flex: 1,
                        child: DashboardCardGenerator(
                            cardType: 'Loan',
                            imagePath: 'assets/images/loan.png',
                            iconColor: Color(0xFFFF9514),
                            cardAmount: '100000'),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 8.0,
          ),

          //dashboard navigate button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Choose an option',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(
            height: 80.0,
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
                  btnOnClickRoute: LoanPage.routeName,
                ),
                CardButtonForDashboard(
                  btnTxt: "History",
                  btnIcon: Icons.history,
                  btnIconBgColor: Colors.orange,
                  btnBgColor: Colors.green,
                  btnOnClickRoute: HistoryPage.routeName,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent History',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Expanded(
                    child: FutureBuilder<List<TransactionModel>>(
                      future: transactionProvider.getAllTransactionsList(1),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount:
                                transactionProvider.transactionList.length,
                            itemBuilder: (context, index) {
                              final tModel =
                                  transactionProvider.transactionList[index];
                              return HistoryListSingleItem(tModel: tModel);
                            },
                          );
                        } else if (snapshot.hasError) {}
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
