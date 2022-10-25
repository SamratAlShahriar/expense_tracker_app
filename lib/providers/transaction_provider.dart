import 'package:expense_tracker_app/database/sqflite/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:expense_tracker_app/model/transaction_model.dart';

class TransactionProvider extends ChangeNotifier{
  List<TransactionModel> transactionList = [];

  Future<int> insertTransaction(TransactionModel transactionModel) async {
    return await DbHelper.insertTransaction(transactionModel);
  }
}