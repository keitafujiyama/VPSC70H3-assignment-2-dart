// PACKAGE
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'global_file/global_method.dart';
import 'global_file/global_provider.dart';



// HOME PAGE
class HomePage extends StatelessWidget {

  // CONSTRUCTOR
  const HomePage ({super.key});



  // MAIN
  @override
  Widget build (BuildContext context) {
    final size = MediaQuery.of (context).size;
    return Consumer <GServerProvider> (builder: (_, GServerProvider provider, __) => GestureDetector (
      onTap: () => FocusScope.of (_).unfocus (),
      child: Scaffold (
        resizeToAvoidBottomInset: false,
        appBar: AppBar (
          automaticallyImplyLeading: false,
          actions: [Row (
            mainAxisSize: MainAxisSize.min,
            children: [
              Text ('${provider.occupancy} ppl',
                textScaleFactor: 0.875,
                style: TextStyle (
                  color: Theme.of (_).primaryColor,
                  fontSize: gSetSize (context),
                ),
              ),
              GestureDetector (
                onTap: () => showDialog <void> (
                  context: context,
                  builder: (_) => AlertDialog (
                    backgroundColor: Colors.grey.shade900,
                    contentPadding: EdgeInsets.all (size.shortestSide * 0.05),
                    shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular (5)),
                    content: Column (
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text ('connected',
                          textScaleFactor: 1,
                          style: TextStyle (
                            color: Theme.of (_).textTheme.bodyText1!.color,
                            fontSize: gSetSize (context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const ListTile (dense: true),
                        Text ('This application is a group chat application that does not require account creation.',
                          textScaleFactor: 0.75,
                          style: TextStyle (
                            color: Theme.of (_).textTheme.bodyText1!.color,
                            fontSize: gSetSize (context),
                          ),
                        ),
                        const ListTile (dense: true),
                        Text.rich (TextSpan (children: [
                          TextSpan (text: '©KEITA FUJIYAMA ${DateTime.now ().year} | '),
                          TextSpan (
                            text: 'LICENSE',
                            recognizer: TapGestureRecognizer ()..onTap = () => showLicensePage (
                              applicationName: 'Assignment 2',
                              applicationLegalese: 'Keita Fujiyama',
                              context: context,
                            ),
                          ),
                          const TextSpan (text: ' | '),
                          TextSpan (
                            recognizer: TapGestureRecognizer ()..onTap = () => launchUrlString ('https://github.com/keitafujiyama/VPSC70H3-assignment-2/'),
                            text: 'REPOSITORY',
                          ),
                        ],),
                          textScaleFactor: 0.75,
                          style: TextStyle (
                            color: Colors.grey,
                            fontSize: gSetSize (context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                child: Icon (Icons.info_outline, size: gSetSize (context)),
              ),
            ].map ((Widget widget) => Padding (
              padding: EdgeInsets.only (right: size.shortestSide * 0.05),
              child: widget,
            ),).toList (),
          )],
        ),
        body: Center (child: Column (
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox (
              width: size.width * 0.5,
              child: FittedBox (child: Text ('connected', style: TextStyle (
                color: Theme.of (_).textTheme.bodyText1!.color,
                fontWeight: FontWeight.w900,
              ),),),
            ),
            SizedBox (height: size.height * 0.1),
            SizedBox (
              width: size.width * 0.5,
              child: MediaQuery (
                data: MediaQuery.of (_).copyWith (textScaleFactor: 0.75),
                child: TextField (
                  autocorrect: false,
                  cursorColor: Colors.grey,
                  enableSuggestions: false,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.send,
                  decoration: InputDecoration (
                    counterText: '',
                    fillColor: Colors.grey.shade900,
                    filled: true,
                    hintText: '4 digits',
                    isDense: true,
                    border: OutlineInputBorder (
                      borderRadius: BorderRadius.circular (5),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onSubmitted: (String string) {
                    if (string.trim ().isNotEmpty) {
                      final number = int.parse (string.trim ());
                      if (number >= 0 && number <= 9999) {
                        provider.updatePassword (context, addZero (4, string.trim ()));
                      }
                    }
                  },
                  style: TextStyle (
                    color: Theme.of (_).primaryColor,
                    fontSize: gSetSize (context),
                  ),
                ),
              ),
            ),
          ],
        ),),
      ),
    ),);
  }
}
