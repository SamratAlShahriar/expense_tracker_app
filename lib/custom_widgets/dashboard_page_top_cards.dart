import 'package:flutter/material.dart';

class DashboardCardGenerator extends StatelessWidget {
  String cardType;
  String imagePath;
  Color iconColor;
  String cardAmount;

  DashboardCardGenerator(
      {required this.cardType,
      required this.imagePath,
      required this.iconColor,
      required this.cardAmount,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24.0,
              backgroundColor: iconColor,
              foregroundColor: Colors.white,
              child: Image.asset(imagePath, height: 24.0, width: 24.0,),
            ),
            Text(cardType, style: TextStyle(
              color: iconColor
            ),),
            Text(
              cardAmount,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
