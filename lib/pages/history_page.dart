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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Card(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Recent Transaction History',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<TransactionModel>>(
                future: transactionProvider.getAllTransactionsList(1),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    if(transactionProvider.transactionList.length < 1){
                      return Center(child: Image.asset('assets/images/no_data.jpg', width: MediaQuery.of(context).size.width * 0.8,));
                    }
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: transactionProvider.transactionList.length,
                        itemBuilder: (context, index) {
                          final tModel = transactionProvider.transactionList[index];
                          return HistoryListSingleItem(tModel: tModel);
                        },
                      ),
                    );
                  } else if(snapshot.hasError){
                    Image.asset('assets/images/no_data.jpg');
                  }
                  return Center(child: CircularProgressIndicator(

                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


}
