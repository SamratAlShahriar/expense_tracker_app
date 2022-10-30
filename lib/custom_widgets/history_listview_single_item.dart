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
        tileColor: _getTileBgColorOnType(tModel.transactionType),
        leading: _getIconBasedOnType(tModel.transactionType),
        title: Text(tModel.transactionDate, style: TextStyle(color: colorBlueDark),),
        subtitle: Text(tModel.note),
        trailing: Text(
          tModel.amount.toString(),
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
            color: _getColorOnType(tModel.transactionType),
          ),
        ),
      ),
    );
  }

  Widget _getIconBasedOnType(String type) {
    switch (type) {
      case TYPE_EXPENSE:
        return CircleAvatar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.remove_circle_outline_outlined,
          ),
        );
      case TYPE_INCOME:
        return CircleAvatar(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: Icon(
              Icons.add_circle_outline,
            ));
      default:
        return CircleAvatar(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            child: Icon(
              Icons.change_circle_outlined,
            ));
    }
  }

  Color _getColorOnType(String type) {
    switch (type) {
      case TYPE_EXPENSE:
        return Colors.red;
      case TYPE_INCOME:
        return Colors.green;
      default:
        return Colors.orange;
    }
  }

  Color _getTileBgColorOnType(String type) {
    switch (type) {
      case TYPE_EXPENSE:
        return colorRedHevvyLight;
      case TYPE_INCOME:
        return colorGreenHevvyLight;
      default:
        return colorOrangeHevvyLight;
    }
  }
}
