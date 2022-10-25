import 'package:flutter/material.dart';

class AddIncomeOrExpensePage extends StatefulWidget {
  static const String routeName = '/add_income_expense_page';

  const AddIncomeOrExpensePage({Key? key}) : super(key: key);

  @override
  State<AddIncomeOrExpensePage> createState() => _AddIncomeOrExpensePageState();
}

class _AddIncomeOrExpensePageState extends State<AddIncomeOrExpensePage> {
  var chipType = "Expense";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                ChoiceChip(
                  elevation: 1,
                  label: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Income',
                      style: TextStyle(
                        fontSize: 20,
                        color:
                        chipType == 'Income' ? Colors.white : Colors.green,
                      ),
                    ),
                  ),
                  selected: chipType == 'Income' ? true : false,
                  backgroundColor: Colors.white70,
                  selectedColor: Colors.green,
                  onSelected: (value) {
                    setState(() {
                      chipType = 'Income';
                    });
                  },
                ),
                ChoiceChip(
                  elevation: 1,
                  label: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Expense',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color:
                        chipType == 'Expense' ? Colors.white : Colors.green,
                      ),
                    ),
                  ),
                  selected: chipType == 'Expense' ? true : false,
                  backgroundColor: Colors.white70,
                  selectedColor: Colors.green,
                  onSelected: (value) {
                    setState(() {
                      chipType = 'Expense';
                    });
                  },
                ),
              ],
            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
