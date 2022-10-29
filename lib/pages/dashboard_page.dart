import 'package:expense_tracker_app/constants/const_strings.dart';
import 'package:expense_tracker_app/custom_widgets/dashboard_page_button.dart';
import 'package:expense_tracker_app/custom_widgets/dashboard_page_top_cards.dart';
import 'package:expense_tracker_app/custom_widgets/history_listview_single_item.dart';
import 'package:expense_tracker_app/pages/analysis_page.dart';
import 'package:expense_tracker_app/pages/history_page.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:expense_tracker_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/sharedpref/shared_pref_helper.dart';
import '../model/transaction_model.dart';
import '../themes/colors.dart';
import 'loan_page.dart';

class DashboardPage extends StatefulWidget {
  //static const String routeName = '/dashboard_page';

  int? userId;

  DashboardPage({required this.userId, Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late TransactionProvider transactionProvider;
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  horizontal: 8.0,
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
                    Icon(
                      Icons.account_balance_wallet,
                      color: Color(0x5f03032F),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    FutureBuilder(
                      future:
                          transactionProvider.calculateTotalBalance(id: widget.userId!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: colorBlueDark,
                                  fontWeight: FontWeight.w600,
                                ),
                          );
                        }
                        if (snapshot.hasError) {
                          print(transactionProvider.totalBalance.toString());
                        }
                        return Text(
                          transactionProvider.totalBalance.toString(),
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: colorBlueDark,
                                    fontWeight: FontWeight.w600,
                                  ),
                        );
                      },
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 16.0,
              ),

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
                        userID:widget.userId,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: DashboardCardGenerator(
                        cardType: 'Expense',
                        imagePath: 'assets/images/expense.png',
                        iconColor: Colors.red,
                        userID:widget.userId,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: DashboardCardGenerator(
                        cardType: 'Loan',
                        imagePath: 'assets/images/loan.png',
                        iconColor: Colors.yellow,
                        userID:widget.userId,
                      ),
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Choose an option',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.blueGrey),
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
                userId: widget.userId,
                callback: () {
                  setState(() {});
                },
              ),
              CardButtonForDashboard(
                btnTxt: "History",
                btnIcon: Icons.history,
                btnIconBgColor: Colors.orange,
                btnBgColor: Colors.green,
                btnOnClickRoute: HistoryPage.routeName,
                userId: widget.userId,
                callback: () {
                  setState(() {});
                },
              ),
              CardButtonForDashboard(
                btnTxt: 'ANALYSIS',
                btnIcon: Icons.analytics,
                btnIconBgColor: Colors.orange,
                btnBgColor: Colors.deepPurple,
                btnOnClickRoute: AnalysisPage.routeName,
                userId:widget.userId,
                callback: () {
                  setState(() {});
                },
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Recent History',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.blueGrey),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<TransactionModel>>(
                  future:
                      transactionProvider.getAllTransactionsList(id: widget.userId!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: transactionProvider.transactionList.length,
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
      ],
    );
  }
}
