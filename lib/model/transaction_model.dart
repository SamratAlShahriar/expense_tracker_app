import 'package:expense_tracker_app/utils/helper_functions.dart';

const String TABLE_TRANSACTION = 'tbl_transaction';
const String T_TRANS_COL_ID = 'id';
const String T_TRANS_COLS_U_ID = 'u_id';
const String T_TRANS_COL_TYPE = 'type';
const String T_TRANS_COL_AMOUNT = 'amount';
const String T_TRANS_COL_NOTE = 'note';
const T_TRANS_COL_DATE = 'date';
const String T_TRANS_COL_E_CATEG = 'category';
const String T_TRANS_COL_TIMESTAMP = 'timestamp';

class TransactionModel {
  int? id;
  int userId;
  String transactionType;
  double amount;
  String note;
  String transactionDate;
  String? expenseCategory;
  String timestamp;

  TransactionModel(
      {required this.userId,
      required this.transactionType,
      required this.amount,
      required this.note,
      required this.transactionDate,
      this.expenseCategory,
      required this.timestamp});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      T_TRANS_COLS_U_ID:userId,
      T_TRANS_COL_TYPE: transactionType,
      T_TRANS_COL_AMOUNT: amount,
      T_TRANS_COL_NOTE: note,
      T_TRANS_COL_DATE: transactionDate,
      T_TRANS_COL_E_CATEG: expenseCategory,
      T_TRANS_COL_TIMESTAMP: timestamp,
    };
    return map;
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) =>
      TransactionModel(
        userId: map[T_TRANS_COLS_U_ID],
        transactionType: map[T_TRANS_COL_TYPE],
        amount: map[T_TRANS_COL_AMOUNT],
        note: map[T_TRANS_COL_NOTE],
        transactionDate: map[T_TRANS_COL_DATE],
        expenseCategory: map[T_TRANS_COL_E_CATEG],
        timestamp: map[T_TRANS_COL_TIMESTAMP],
      );
}
