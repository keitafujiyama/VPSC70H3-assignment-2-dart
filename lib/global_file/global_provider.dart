// PACKAGE
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pubnub/pubnub.dart';

import 'global_class.dart';
import 'global_method.dart';



// GLOBAL PROVIDER
class GServerProvider with ChangeNotifier {

  // METHOD
  Future <void> connectServer () async {
    id = 'user${addZero (9, Random ().nextInt (1000000000).toString ())}';


    _server = PubNub (defaultKeyset: Keyset (
      publishKey: 'pub-c-9d2f8490-0070-48d0-b682-434335f33d85',
      subscribeKey: 'sub-c-bac59876-453b-43ef-844d-1ad8af83314b',
      userId: UserId (id),
    ),);

    final subscription = _server.subscribe (channels: {_channel}, withPresence: true);

    subscription.messages.listen ((Envelope envelope) {
      if (_channel == envelope.channel && code.isNotEmpty) {
        final message = GMessageClass.fromMap (envelope.publishedAt.toDateTime (), envelope.content as Map <String, dynamic>, envelope.uuid.value);

        if (message.code == code) {
          messages.add (message);

          notifyListeners ();
        }
      }
    });

    subscription.presence.listen ((PresenceEvent event) {
      if (event.occupancy != occupancy) {

        occupancy = event.occupancy;

        notifyListeners ();
      }
    });

    _isConnected = true;

    notifyListeners ();
  }

  Future <void> publishMessage (String message) async {
    if (code.isNotEmpty && _isConnected) {
      await _server.publish (_channel, <String, dynamic> {
        'code': code,
        'message': message,
      });
    }
  }

  void updatePassword (BuildContext context, String code1) {
    if (code != code1 && code1.isNotEmpty) {
      code = code1;
      messages.clear ();
      publishMessage ('Hello');

      notifyListeners ();
    }

    Navigator.of (context).pushNamed ('/room');
  }

  // PROPERTY
  bool _isConnected = false;
  final List <GMessageClass> messages = [];
  final String _channel = 'Connected';
  int occupancy = 0;
  PubNub _server = PubNub ();
  String code = '';
  String id = '';
}
