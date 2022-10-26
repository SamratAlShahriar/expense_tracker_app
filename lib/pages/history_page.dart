import 'package:expense_tracker_app/constants/const_strings.dart';
import 'package:expense_tracker_app/model/transaction_model.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
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
        body: FutureBuilder<List<TransactionModel>>(
          future: transactionProvider.getAllTransactionsList(1),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: transactionProvider.transactionList.length,
                itemBuilder: (context, index) {
                  final tModel = transactionProvider.transactionList[index];
                  return ListTile(
                    leading: _getIconBasedOnType(tModel.transactionType),
                    title: Text(tModel.note),
                    subtitle: Text(tModel.transactionDate),
                    trailing: Text(tModel.amount.toString()),
                  );
                },
              );
            } else if(snapshot.hasError){

            }
            return Center(child: CircularProgressIndicator(

            ));
          },
        ),
      ),
    );
  }

  Widget _getIconBasedOnType(String type) {
    switch (type) {
      case TYPE_EXPENSE:
        return CircleAvatar(backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: Icon(Icons.arrow_upward,));
      case TYPE_INCOME:
        return CircleAvatar(backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: Icon(Icons.arrow_upward,));
      default:
        return CircleAvatar(
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.white,
            child: Icon(Icons.call_missed,));
    }
  }
}
