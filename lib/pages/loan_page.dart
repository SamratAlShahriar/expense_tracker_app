import 'package:expense_tracker_app/constants/const_strings.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoanPage extends StatefulWidget {
  static const String routeName = '/loan_page';

  const LoanPage({Key? key}) : super(key: key);

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  late TransactionProvider transactionProvider;
  int? userId;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    final args = ModalRoute.of(context)!.settings.arguments as int;
    userId = args;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Loan'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCard(
                    'TOTAL LOAN',
                    Colors.orange,
                    transactionProvider.getTypedTotalAmount(
                        id: userId!, type: TYPE_LOAN)),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCard('PAID LOAN', Colors.green,
                    transactionProvider.getLoanTotalPaidAmount(userId!)),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCard(
                    'DUE LOAN',
                    Colors.red,
                    transactionProvider.calculatDueLoan(userId!)),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget getCard(String cardTxt, Color txtColor, Future<double> futureData) {
    return Card(
      elevation: 10.0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 32.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$cardTxt : ',
              style: TextStyle(),
            ),
            FutureBuilder(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: txtColor,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Text(
                    '0',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
