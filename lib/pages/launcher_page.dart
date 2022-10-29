import 'package:expense_tracker_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/database/sharedpref/shared_pref_helper.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'auth/login_page.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    redirectUser();
    super.initState();
  }

  Future<void> redirectUser() async {
    if(await SharedPrefHelper.getLoggedInStatus()) {
      final userId = await SharedPrefHelper.getUserId();
      await Provider.of<UserProvider>(context, listen: false).getUserById(userId);
      Navigator.pushReplacementNamed(context, Homepage.routeName, arguments: userId);
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}