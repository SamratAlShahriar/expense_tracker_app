import 'package:flutter/material.dart';

class LoanPage extends StatefulWidget {
  static const String routeName = '/loan_page';

  const LoanPage({Key? key}) : super(key: key);

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CircleAvatar(
            radius: 36.0,
            backgroundColor: Colors.orange,
            child: Image.asset(
              'assets/images/expense.png',
              height: 36,
              width: 36,
            ),
          ),
        ),
      ),
    );
  }
}
