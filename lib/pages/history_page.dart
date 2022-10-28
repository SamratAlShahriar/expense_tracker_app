import 'package:expense_tracker_app/constants/const_strings.dart';
import 'package:expense_tracker_app/custom_widgets/history_listview_single_item.dart';
import 'package:expense_tracker_app/model/transaction_model.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:expense_tracker_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  static const String routeName = '/history_page';

  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late TransactionProvider transactionProvider;
  String selectionType = "All";

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    //transactionProvider.getAllTransactionsList(1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Transaction History',
          ),
        ),
        body: Column(
          children: [
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //choice of transaction type
                  Row(
                    children: [
                      SizedBox(
                        width: 2.0,
                      ),
                      ChoiceChip(
                        elevation: 1,
                        label: Text(
                          TYPE_ALL,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: selectionType == TYPE_ALL
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                        selected: selectionType == TYPE_ALL ? true : false,
                        backgroundColor: Colors.white70,
                        selectedColor: colorBlueDark,
                        onSelected: (value) {
                          setState(() {
                            selectionType = TYPE_ALL;
                          });
                        },
                      ),
                      ChoiceChip(
                        elevation: 1,
                        label: Text(
                          TYPE_INCOME,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: selectionType == TYPE_INCOME
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                        selected: selectionType == TYPE_INCOME ? true : false,
                        backgroundColor: Colors.white70,
                        selectedColor: Colors.green,
                        onSelected: (value) {
                          setState(() {
                            selectionType = TYPE_INCOME;
                          });
                        },
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      ChoiceChip(
                        elevation: 1,
                        label: Text(
                          TYPE_EXPENSE,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: selectionType == TYPE_EXPENSE
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                        selected: selectionType == TYPE_EXPENSE ? true : false,
                        backgroundColor: Colors.white70,
                        selectedColor: Colors.red,
                        onSelected: (value) {
                          setState(() {
                            selectionType = TYPE_EXPENSE;
                          });
                        },
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      ChoiceChip(
                        elevation: 1,
                        label: Text(
                          TYPE_LOAN,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: selectionType == TYPE_LOAN
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                        selected: selectionType == TYPE_LOAN ? true : false,
                        backgroundColor: Colors.white70,
                        selectedColor: Colors.yellow,
                        onSelected: (value) {
                          setState(() {
                            selectionType = TYPE_LOAN;
                          });
                        },
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              child: FutureBuilder<List<TransactionModel>>(
                future: selectionType == TYPE_ALL
                    ? transactionProvider.getAllTransactionsList(1)
                    : transactionProvider.getTypedTransactionsList(
                        id: 1, type: selectionType),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (transactionProvider.transactionList.length < 1) {
                      return Center(
                          child: Image.asset(
                        'assets/images/no_data.jpg',
                        width: MediaQuery.of(context).size.width * 0.8,
                      ));
                    }
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: transactionProvider.transactionList.length,
                        itemBuilder: (context, index) {
                          final tModel =
                              transactionProvider.transactionList[index];
                          return HistoryListSingleItem(tModel: tModel);
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    Image.asset('assets/images/no_data.jpg');
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
