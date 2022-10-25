import 'package:expense_tracker_app/constants/constants_values1.dart';
import 'package:expense_tracker_app/model/transaction_model.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:expense_tracker_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddIncomeOrExpensePage extends StatefulWidget {
  static const String routeName = '/add_income_expense_page';

  const AddIncomeOrExpensePage({Key? key}) : super(key: key);

  @override
  State<AddIncomeOrExpensePage> createState() => _AddIncomeOrExpensePageState();
}

class _AddIncomeOrExpensePageState extends State<AddIncomeOrExpensePage> {
  late TransactionProvider transactionProvider;
  String selectionType = "Income";
  DateTime? selectedDate;
  final _formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  String? selectedCategory;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    transactionProvider = Provider.of(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    amountController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Add Income Or Expense'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                //choice of transaction type
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.type_specimen_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ChoiceChip(
                      elevation: 1,
                      label: Text(
                        'Income',
                        style: TextStyle(
                          fontSize: 20,
                          color: selectionType == 'Income'
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      selected: selectionType == 'Income' ? true : false,
                      backgroundColor: Colors.white70,
                      selectedColor: Colors.green,
                      onSelected: (value) {
                        setState(() {
                          selectionType = 'Income';
                        });
                      },
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    ChoiceChip(
                      elevation: 1,
                      label: Text(
                        'Expense',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: selectionType == 'Expense'
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      selected: selectionType == 'Expense' ? true : false,
                      backgroundColor: Colors.white70,
                      selectedColor: Colors.red,
                      onSelected: (value) {
                        setState(() {
                          selectionType = 'Expense';
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),

                //input fields
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.monetization_on_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: amountController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '0',
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.note_alt_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: noteController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Note',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            child: Text(
                              selectedDate == null
                                  ? 'Choose a date'
                                  : getFormattedDate(
                                      selectedDate!, datePattern),
                            ),
                            onPressed: () {
                              selectDate();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    selectionType == 'Expense'
                        ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.category_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    hint: Text('Select Expense Category'),
                                    items: expenseCategoryPredefinedList
                                        .map((e) => DropdownMenuItem(
                                            value: e, child: Text(e)))
                                        .toList(),
                                    value: selectedCategory,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedCategory = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Text(
                                  'SAVE',
                                ),
                              ),
                              onPressed: () {
                                // TODO: save button work
                                _saveData();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectDate() async {
    final mDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (mDate != null) {
      setState(() {
        selectedDate = mDate;
      });
    }
  }

  void _saveData() {
    if (selectedDate == null) {
      showMsg(context, 'Please select a date');
      return;
    }
    var model = TransactionModel(
        transactionType: selectionType,
        amount: double.parse(amountController.text),
        note: noteController.text,
        expenseCategory: selectionType == 'Expense' ? selectedCategory : null,
        transactionDate: getFormattedDate(selectedDate!, datePattern),
        timestamp: getFormattedDate(DateTime.now(), dateTimePattern));

    transactionProvider.insertTransaction(model);
  }

}
