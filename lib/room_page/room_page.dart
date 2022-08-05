// PACKAGE
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../global_file/global_class.dart';
import '../global_file/global_method.dart';
import '../global_file/global_provider.dart';
import 'room_widget.dart';



// ROOM PAGE
class RoomPage extends StatelessWidget {

  // CONSTRUCTOR
  const RoomPage ({super.key});



  // MAIN
  @override
  Widget build (BuildContext context) {
    final size = MediaQuery.of (context).size;
    return Consumer <GServerProvider> (builder: (_, GServerProvider provider, __) => GestureDetector (
      onTap: () => FocusScope.of (_).unfocus (),
      child: Scaffold (
        appBar: AppBar (
          leading: GestureDetector (
            onTap: () => Navigator.of (_).pop (),
            child: Icon (Icons.close, size: gSetSize (context)),
          ),
          title: Text ('#${provider.code}',
            textScaleFactor: 1.125,
            style: TextStyle (
              color: Theme.of (_).textTheme.bodyText1!.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView (
          padding: EdgeInsets.symmetric (horizontal: size.width * 0.05),
          children: [
            Column (
              mainAxisSize: MainAxisSize.min,
              children: provider.messages.map ((GMessageClass message) => Container (
                color: message.id == provider.id ? Colors.grey.shade900 : Colors.transparent,
                padding: EdgeInsets.all (size.shortestSide * 0.025),
                width: double.maxFinite,
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text (message.id == provider.id ? 'You' : message.id,
                      textScaleFactor: 0.75,
                      style: TextStyle (
                        color: Colors.grey,
                        fontSize: gSetSize (context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text (message.message,
                      textScaleFactor: 1,
                      style: TextStyle (
                        color: Theme.of (_).primaryColor,
                        fontSize: gSetSize (context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text (DateFormat ('yyyy/MM/dd HH:mm:ss').format (message.date),
                      textScaleFactor: 0.5,
                      style: TextStyle (
                        color: Colors.grey,
                        fontSize: gSetSize (context),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),).toList (),
            ),
            const ListTile (dense: true),
          ],
        ),
        bottomNavigationBar: Padding (
          padding: EdgeInsets.only (
            bottom: MediaQuery.of (_).viewInsets.bottom + size.shortestSide * 0.01,
            left: size.shortestSide * 0.05,
            right: size.shortestSide * 0.05,
          ),
          child: const MessageBar (),
        ),
      ),
    ),);
  }
}
