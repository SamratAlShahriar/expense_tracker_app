import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';
import '../../database/sharedpref/shared_pref_helper.dart';

class DashboardCardGenerator extends StatelessWidget {
  late TransactionProvider transactionProvider;
  String cardType;
  String imagePath;
  Color iconColor;
  int? userID = 1;

  DashboardCardGenerator(
      {required this.cardType,
      required this.imagePath,
      required this.iconColor,
      Key? key})
      : super(key: key);

  void getUser() async {
    if (userID == null) {
      userID = await SharedPrefHelper.getUserId();
    }
  }

  @override
  Widget build(BuildContext context) {
    transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    getUser();

    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24.0,
              backgroundColor: iconColor,
              foregroundColor: Colors.white,
              child: Image.asset(
                imagePath,
                height: 24.0,
                width: 24.0,
              ),
            ),
            Text(
              cardType,
              style: TextStyle(color: iconColor),
            ),
            FutureBuilder(
              future: transactionProvider.getTypedTotalAmount(
                  id: userID!, type: cardType),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: iconColor,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Text(
                    '0',
                    style: TextStyle(
                      color: iconColor,
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
