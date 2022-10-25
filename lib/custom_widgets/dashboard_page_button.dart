import 'package:flutter/material.dart';

class CardButtonForDashboard extends StatelessWidget {
  Color btnBgColor;
  Color btnIconBgColor;
  IconData btnIcon;
  String btnTxt;
  String btnOnClickRoute;

  CardButtonForDashboard(
      {required this.btnTxt,
        required this.btnIcon,
        required this.btnBgColor,
        required this.btnIconBgColor,
        required this.btnOnClickRoute,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, btnOnClickRoute);
      },
      child: Card(
        elevation: 5,
        color: btnBgColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: btnIconBgColor,
                  foregroundColor: Colors.white,
                  child: Icon(
                    btnIcon,
                  )),
              SizedBox(
                height: 4.0,
              ),
              Center(
                child: Text(
                  btnTxt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
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
