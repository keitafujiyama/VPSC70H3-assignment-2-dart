// PACKAGE
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../global_file/global_method.dart';
import '../global_file/global_provider.dart';



// ROOM WIDGET
class MessageBar extends StatefulWidget {

  // CONSTRUCTOR
  const MessageBar ({super.key});



  // MAIN
  @override
  State <MessageBar> createState () => _MessageBarState ();
}
class _MessageBarState extends State <MessageBar> {

  // PROPERTY
  final TextEditingController _controller = TextEditingController ();



  // MAIN
  @override
  void dispose () {
    super.dispose ();

    _controller.dispose( );
  }

  @override
  Widget build (_) => Consumer <GServerProvider> (builder: (_, GServerProvider provider, __) => Row (children: [
    Expanded (child: MediaQuery (
      data: MediaQuery.of (_).copyWith (textScaleFactor: 0.5),
      child: TextField (
        controller: _controller,
        cursorColor: Colors.grey,
        keyboardType: TextInputType.multiline,
        maxLength: 200,
        maxLines: null,
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration (
          counterText: '',
          fillColor: Colors.grey.shade900,
          filled: true,
          hintText: 'Hello',
          isDense: true,
          border: OutlineInputBorder (
            borderRadius: BorderRadius.circular (5),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle (
          color: Theme.of (_).primaryColor,
          fontSize: gSetSize (context),
        ),
      ),
    ),),
    SizedBox (width: MediaQuery.of (_).size.shortestSide * 0.01),
    GestureDetector (
      onTap: () {
        if (_controller.text.trim ().isNotEmpty) {
          provider.publishMessage (_controller.text.trim ()).then ((_) {
            _controller.clear ();
            FocusScope.of (context).unfocus ();
          });
        }
      },
      child: Icon (Icons.send,
        color: Colors.grey,
        size: gSetSize (context),
      ),
    ),
  ],),);
}
