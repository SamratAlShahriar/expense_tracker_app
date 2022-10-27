import 'package:expense_tracker_app/model/transaction_model.dart';
import 'package:flutter/material.dart';

import '../constants/const_strings.dart';
import '../themes/colors.dart';

class HistoryListSingleItem extends StatelessWidget {
  TransactionModel tModel;

  HistoryListSingleItem({required this.tModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ListTile(
        tileColor: _getTitleColorOnType(tModel.transactionType),
        leading: _getIconBasedOnType(tModel.transactionType),
        title: Text(tModel.note),
        subtitle: Text(tModel.transactionDate),
        trailing: Text(tModel.amount.toString()),
      ),
    );
  }

  Widget _getIconBasedOnType(String type) {
    switch (type) {
      case TYPE_EXPENSE:
        return CircleAvatar(backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: Icon(Icons.remove_circle_outline_outlined,));
      case TYPE_INCOME:
        return CircleAvatar(backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: Icon(Icons.add_circle_outline,));
      default:
        return CircleAvatar(
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.white,
            child: Icon(Icons.change_circle_outlined,));
    }
  }

  Color _getTitleColorOnType(String type) {
    switch (type) {
      case TYPE_EXPENSE:
        return colorRedHevvyLight;
      case TYPE_INCOME:
        return colorGreenHevvyLight;
      default:
        return colorYellowHevvyLight;
    }
  }
}
