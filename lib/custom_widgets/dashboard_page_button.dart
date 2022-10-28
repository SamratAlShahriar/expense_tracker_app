import 'package:flutter/material.dart';

class CardButtonForDashboard extends StatelessWidget {
  Color btnBgColor;
  Color btnIconBgColor;
  IconData btnIcon;
  String btnTxt;
  String btnOnClickRoute;
  Function callback;

  CardButtonForDashboard(
      {required this.btnTxt,
        required this.btnIcon,
        required this.btnBgColor,
        required this.btnIconBgColor,
        required this.btnOnClickRoute,
        required this.callback,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, btnOnClickRoute).then((value) => callback);
      },
      child: Card(
        elevation: 2.0,
        color: btnBgColor,
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
                  backgroundColor: btnIconBgColor,
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
