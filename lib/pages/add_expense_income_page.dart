import 'package:flutter/material.dart';

class AddIncomeOrExpensePage extends StatefulWidget {
  static const String routeName = '/add_income_expense_page';

  const AddIncomeOrExpensePage({Key? key}) : super(key: key);

  @override
  State<AddIncomeOrExpensePage> createState() => _AddIncomeOrExpensePageState();
}

class _AddIncomeOrExpensePageState extends State<AddIncomeOrExpensePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  width: 1,
                )
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black
                    ),
                    child: Icon(Icons.money, color: Colors.white,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '0',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
