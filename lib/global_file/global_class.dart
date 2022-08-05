class GMessageClass {

  // CONSTRUCTOR
  GMessageClass ();

  // INSTANCE
  GMessageClass.fromMap (DateTime date1, Map <String, dynamic> map, String id1) {
    code = map ['code'] as String;
    date = date1;
    id = id1;
    message = map ['message'] as String;
  }

  // PROPERTY
  DateTime date = DateTime.now ();
  String code = '=';
  String id = '';
  String message = '';
}
