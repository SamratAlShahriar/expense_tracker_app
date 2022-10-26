import 'package:flutter/material.dart';

class DashboardCardGenerator extends StatelessWidget {
  String cardType;
  IconData iconType;
  Color iconColor;
  String cardAmount;

  DashboardCardGenerator(
      {required this.cardType,
      required this.iconType,
      required this.iconColor,
      required this.cardAmount,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: iconColor,
                  foregroundColor: Colors.white,
                  child: Icon(
                    iconType,
                  ),
                ),
                Text(cardType),
              ],
            ),
            Text(
              cardAmount,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
