import 'package:sqflite/sqflite.dart';

import '../../model/transaction_model.dart';
import 'package:path/path.dart' as Path;

class DbHelper {
  static const String CREATE_TALBE_TRANSACTION =
      '''CREATE TABLE $TABLE_TRANSACTION(
  $T_TRANS_COL_ID INTEGER PRIMARY KEY AUTOINCREMENT,
  $T_TRANS_COLS_U_ID INTEGER,
  $T_TRANS_COL_TYPE TEXT,
  $T_TRANS_COL_AMOUNT REAL,
  $T_TRANS_COL_NOTE TEXT,
  $T_TRANS_COL_DATE TEXT,
  $T_TRANS_COL_E_CATEG TEXT,
  $T_TRANS_COL_TIMESTAMP TEXT)''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'pocket_db');

    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(CREATE_TALBE_TRANSACTION);
    }, onUpgrade: (db, oldVersion, newVersion) async {});
  }

  static Future<int> insertTransaction(TransactionModel transactionModel) async {
    final db = await open();
    return db.insert(TABLE_TRANSACTION, transactionModel.toMap());
  }

  static Future<List<TransactionModel>> getAllTransactionsList(int id) async {
    final db = await open();
    final tMapList = await db.query(TABLE_TRANSACTION, where: '$T_TRANS_COLS_U_ID = ?',
        whereArgs:  [id], orderBy: '$T_TRANS_COL_TIMESTAMP DESC');

    return List.generate(tMapList.length, (index) =>
        TransactionModel.fromMap(tMapList[index]));
  }

  static Future<double> getTypedTotalAmount(int id, String type) async{
    final db = await open();
    final sumMap = await db.rawQuery("SELECT SUM($T_TRANS_COL_AMOUNT) AS $type FROM tbl_transaction WHERE u_id = $id AND $T_TRANS_COL_TYPE = '$type' ");
    final sumObj = sumMap.first;
    return sumObj[type] as double;
  }
}
