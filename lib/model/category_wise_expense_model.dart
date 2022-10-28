import 'package:expense_tracker_app/model/transaction_model.dart';

const String T_COL_CATEGORY_SUM = 'category_sum';

class CategoryWiseExpenseModel {
  String category;
  double categorySum;

  CategoryWiseExpenseModel({required this.category, required this.categorySum});

  factory CategoryWiseExpenseModel.fromMap(Map<String, dynamic> map) =>
      CategoryWiseExpenseModel(
          category: map[T_TRANS_COL_E_CATEG],
          categorySum: map[T_COL_CATEGORY_SUM]);

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      T_TRANS_COL_E_CATEG: category,
      T_COL_CATEGORY_SUM: categorySum,
    };
    return map;
  }
}
