import 'package:fademasterz/Utils/app_assets.dart';
import 'package:flutter/material.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      // FlutterNativeSplash.remove();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EnterYourNo(),
        ),
      );
    });
    super.initState();
  }

  // Future<void> getLocalData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isLogin = prefs.getBool('isLogin');
  //   setState(() {});
  //   Future.delayed(const Duration(seconds: 3), () {
  //     // FlutterNativeSplash.remove();
  //     if (isLogin ?? false) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const DashboardScreen(),
  //         ),
  //       );
  //     } else {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const OnBoardingScreen(),
  //         ),
  //       );
  //     }
  //   });
  // }
}
