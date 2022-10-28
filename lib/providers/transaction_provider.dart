import 'package:expense_tracker_app/database/sqflite/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:expense_tracker_app/model/transaction_model.dart';

import '../model/category_wise_expense_model.dart';

class TransactionProvider extends ChangeNotifier{
  List<TransactionModel> transactionList = [];
  List<CategoryWiseExpenseModel> categoryWiseExpenseList = [];

  Future<int> insertTransaction(TransactionModel transactionModel) async {
    return await DbHelper.insertTransaction(transactionModel);
  }

  Future<List<TransactionModel>> getAllTransactionsList(int id) async {
    transactionList = await DbHelper.getAllTransactionsList(id);
    notifyListeners();
    return transactionList;
  }

  Future<double> getTypedTotalAmount(int id, String type){
    return DbHelper.getTypedTotalAmount(id, type);
  }

  Future<List<CategoryWiseExpenseModel>> getCategoryWiseExpenseList(int id) async {
    return categoryWiseExpenseList = await DbHelper.getCategoryWiseExpenseList(id);
  }
}