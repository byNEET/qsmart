import 'package:firebase_database/firebase_database.dart';

class Fbdatabase {
  static final FirebaseDatabase db = FirebaseDatabase.instance;
  final DatabaseReference ref = db.reference();
}
