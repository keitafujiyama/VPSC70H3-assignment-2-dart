// PACKAGE
import 'package:flutter/material.dart';

import 'global_file/global_method.dart';



// SPLASH WIDGET
class SplashPage extends StatefulWidget {

  // CONSTRUCTOR
  const SplashPage ({super.key});



  // MAIN
  @override
  State <SplashPage> createState () => _SplashPageState ();
}
class _SplashPageState extends State <SplashPage> {

  @override
  void initState () {
    super.initState ();

    Future <void>.delayed (const Duration (seconds: 1), () => Navigator.of (context).pushReplacementNamed ('/home'));
  }

  @override
  Widget build (_) => Scaffold (
    backgroundColor: const Color (0xFF002554),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    body: Center (child: Text ('Assignment 2',
      textScaleFactor: 1.5,
      style: TextStyle (
        color: Colors.white,
        fontSize: gSetSize (context),
        fontWeight: FontWeight.bold,
      ),
    ),),
    floatingActionButton: Text ('Keita Fujiyama\nVPSC70H3',
      textAlign: TextAlign.center,
      textScaleFactor: 1,
      style: TextStyle (
        color: Colors.white,
        fontSize: gSetSize (context),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
