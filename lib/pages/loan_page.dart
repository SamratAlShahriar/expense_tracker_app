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
        body: Column(
          children: [
            Card(
              child: Row(
                children: [
                  Text('Remaining Loan '),
                  Text('19000000'),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Card(
              child: Column(
                children: [
                  Text('Next premium in'),
                  Text('6 Days'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
