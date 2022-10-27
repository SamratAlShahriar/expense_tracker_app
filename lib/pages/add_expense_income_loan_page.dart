import 'package:expense_tracker_app/constants/const_strings.dart';
import 'package:expense_tracker_app/constants/constants_values1.dart';
import 'package:expense_tracker_app/model/transaction_model.dart';
import 'package:expense_tracker_app/providers/transaction_provider.dart';
import 'package:expense_tracker_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddIncomeOrExpenseOrLoanPage extends StatefulWidget {
  static const String routeName = '/add_income_expense_loan_page';

  const AddIncomeOrExpenseOrLoanPage({Key? key}) : super(key: key);

  @override
  State<AddIncomeOrExpenseOrLoanPage> createState() =>
      _AddIncomeOrExpenseOrLoanPageState();
}

class _AddIncomeOrExpenseOrLoanPageState
    extends State<AddIncomeOrExpenseOrLoanPage> {
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
          title: Text(
            'Add $selectionType',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
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
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    ChoiceChip(
                      elevation: 1,
                      label: Text(
                        TYPE_INCOME,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: selectionType == TYPE_INCOME
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      selected: selectionType == TYPE_INCOME ? true : false,
                      backgroundColor: Colors.white70,
                      selectedColor: Colors.green,
                      onSelected: (value) {
                        setState(() {
                          selectionType = TYPE_INCOME;
                        });
                      },
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    ChoiceChip(
                      elevation: 1,
                      label: Text(
                        TYPE_EXPENSE,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: selectionType == TYPE_EXPENSE
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      selected: selectionType == TYPE_EXPENSE ? true : false,
                      backgroundColor: Colors.white70,
                      selectedColor: Colors.red,
                      onSelected: (value) {
                        setState(() {
                          selectionType = TYPE_EXPENSE;
                        });
                      },
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    ChoiceChip(
                      elevation: 1,
                      label: Text(
                        TYPE_LOAN,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: selectionType == TYPE_LOAN
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                      selected: selectionType == TYPE_LOAN ? true : false,
                      backgroundColor: Colors.white70,
                      selectedColor: Colors.orange,
                      onSelected: (value) {
                        setState(() {
                          selectionType = TYPE_LOAN;
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
                              size: 30,
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
                              size: 30,
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
                              size: 30,
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
                    selectionType == TYPE_EXPENSE
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
                                    size: 30,
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
                                if (selectedCategory == 'Add Category')
                                  TextButton(
                                      onPressed: () {}, child: Icon(Icons.add))
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
        userId: 1,
        transactionType: selectionType,
        amount: double.parse(amountController.text),
        note: noteController.text,
        expenseCategory:
            selectionType == TYPE_EXPENSE ? selectedCategory : null,
        transactionDate: getFormattedDate(selectedDate!, datePattern),
        timestamp: DateTime.now().toString());

    transactionProvider.insertTransaction(model);
  }
}
