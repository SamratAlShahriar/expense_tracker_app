import 'package:expense_tracker_app/database/sharedpref/shared_pref_helper.dart';
import 'package:expense_tracker_app/pages/launcher_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          SharedPrefHelper.setloggedInStatus(false);
          if(mounted) Navigator.pushReplacementNamed(context, LauncherPage.routeName);
        },
        child: Text('LOGOUT'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30),),
          ),
          elevation: 50.0,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16.0),
        ),
      ),
    );
  }
}
