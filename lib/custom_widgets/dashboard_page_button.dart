import 'package:expense_tracker_app/themes/colors.dart';
import 'package:flutter/material.dart';

class CardButtonForDashboard extends StatelessWidget {
  IconData btnIcon;
  String btnTxt;
  String btnOnClickRoute;
  Function callback;
  int? userId;

  CardButtonForDashboard(
      {required this.btnTxt,
        required this.btnIcon,
        required this.btnOnClickRoute,
        required this.callback,
        required this.userId,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, btnOnClickRoute, arguments: userId).then((value) => callback);
      },
      child: Card(
        elevation: 2.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: EdgeInsets.symmetric
            (
            horizontal: 32.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: colorBlueDark,
                  foregroundColor: Colors.white,
                  radius: 16.0,
                  child: Icon(
                    btnIcon,
                    size: 20.0,
                  )),
              SizedBox(
                height: 2.0,
              ),
              Center(
                child: Text(
                  btnTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colorBlueDark,
                      fontWeight: FontWeight.w500
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
