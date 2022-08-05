// PACKAGE
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'global_file/global_provider.dart';
import 'home_page.dart';
import 'room_page/room_page.dart';
import 'splash_page.dart';



// MAIN
void main () {
  setUrlStrategy (PathUrlStrategy ());

  runApp (const MyApp ());
}

class MyApp extends StatelessWidget {

  // CONSTRUCTOR
  const MyApp ({super.key});



  // MAIN
  @override
  Widget build (BuildContext context) {
    rootBundle.loadString ('asset/openFontLicense.txt').then ((String txt) => LicenseRegistry.addLicense (() => Stream <LicenseEntry>.fromIterable (<LicenseEntry> [LicenseEntryWithLineBreaks (<String> ['google_fonts'], txt)])));
    return ChangeNotifierProvider (
      create: (_) => GServerProvider ()..connectServer (),
      child: WillPopScope (
        onWillPop: () async => false,
        child: MaterialApp (
          initialRoute: '/',
          title: 'connected',
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/home':
                return PageRouteBuilder <void> (pageBuilder: (_, __, ___) => const HomePage ());

              case '/room':
                return PageRouteBuilder <void> (pageBuilder: (_, __, ___) => const RoomPage ());

              default:
                return PageRouteBuilder <void> (pageBuilder: (_, __, ___) => const SplashPage ());
            }
          },
          theme: ThemeData (
            brightness: Brightness.dark,
            fontFamily: GoogleFonts.jetBrainsMono ().fontFamily,
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.black,
            textTheme: const TextTheme (bodyText1: TextStyle (color: Colors.white)),
            appBarTheme: AppBarTheme (
              actionsIconTheme: const IconThemeData (color: Colors.white),
              backgroundColor: Colors.black,
              centerTitle: true,
              elevation: double.minPositive,
              iconTheme: const IconThemeData (color: Colors.white),
              titleTextStyle: TextStyle (
                color: Colors.white,
                fontFamily: GoogleFonts.jetBrainsMono ().fontFamily,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
