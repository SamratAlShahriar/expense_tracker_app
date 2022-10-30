import 'package:expense_tracker_app/constants/const_strings.dart';
import 'package:expense_tracker_app/database/sqflite/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:expense_tracker_app/model/transaction_model.dart';

import '../model/category_wise_expense_model.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> transactionList = [];
  List<CategoryWiseExpenseModel> categoryWiseExpenseList = [];

  double totalBalance = 0;
  double totalLoanDue = 0;

  Future<int> insertTransaction(TransactionModel transactionModel) async {
    return await DbHelper.insertTransaction(transactionModel);
  }

  Future<List<TransactionModel>> getAllTransactionsList(
      {required int id}) async {
    transactionList = await DbHelper.getAllTransactionsList(id);
    notifyListeners();
    return transactionList;
  }

  Future<List<TransactionModel>> getTypedTransactionsList(
      {required int id, required String type}) async {
    transactionList =
        await DbHelper.getTypedTransactionsList(id: id, type: type);
    notifyListeners();
    return transactionList;
  }

  Future<List<TransactionModel>> getTimePeriodTransactionsList(
      {required int userId,
      required String startTime,
      required String,
      endTime}) async {
    return await DbHelper.getTimePeriodTransactionsList(
            userId: userId, startTime: startTime, endTime: endTime)
        .then((value) {
      transactionList = value;
      return value;
    });
  }

  Future<double> getTypedTotalAmount(
      {required int id, required String type}) async {
    return await DbHelper.getTypedTotalAmount(id, type);
  }

  Future<double> getLoanTotalPaidAmount(int id) async {
    return DbHelper.getLoanTotalPaidAmount(id);
  }

  Future<double> calculatDueLoan(int id) async{
    double result = 0;
    result += await getTypedTotalAmount(id: id, type: TYPE_LOAN);
    result -= await getLoanTotalPaidAmount(id);
    totalLoanDue = result;
    return result;
  }

    Future<double> calculateTotalBalance({required int id}) async {
    double result = 0;
    result += await getTypedTotalAmount(id: id, type: TYPE_INCOME);

    result -= await getTypedTotalAmount(id: id, type: TYPE_EXPENSE);

    result += await getTypedTotalAmount(id: id, type: TYPE_LOAN);
    totalBalance = result;
    return result;
  }

  Future<List<CategoryWiseExpenseModel>> getCategoryWiseExpenseList(
      {required int id, required String startTime, required String endTime}) async {
    return categoryWiseExpenseList =
        await DbHelper.getCategoryWiseExpenseList(id: id, startTime: startTime, endTime: endTime);
  }
}
