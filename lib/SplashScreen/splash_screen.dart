import 'package:fademasterz/Dashboard/dashboard.dart';
import 'package:fademasterz/Utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screen/enter_yourno.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppAssets.splash,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 3), () {
    //   // FlutterNativeSplash.remove();
    //
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const EnterYourNo(),
    //     ),
    //   );
    // });
    getLocalData();
    setState(() {});
    super.initState();
  }

  bool? profileSetUp = false;
  Future<void> getLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    profileSetUp = prefs.getBool('profileSetUp');
    setState(() {});
    Future.delayed(const Duration(seconds: 3), () {
      // FlutterNativeSplash.remove();
      if (profileSetUp ?? false) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashBoardScreen(selectIndex: 0),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const EnterYourNo(),
          ),
        );
      }
    });
  }
}
