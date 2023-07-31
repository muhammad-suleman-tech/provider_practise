import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider/login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height * 1;
    final width =  MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/images/splash.jpg",
              fit: BoxFit.cover,  height: height * .7, ),
             SizedBox(height: height * 0.03,),
            const Text("Top Headlines",style: TextStyle(fontSize: 25,fontFamily: 'Roboto '),),
            SizedBox(height: height * 0.03,),
           const SpinKitPouringHourGlassRefined(
                color: Colors.orangeAccent,
              size: 60,

            )

          ],
        ),
      ),
    );
  }
}
