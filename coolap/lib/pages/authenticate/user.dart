import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(
    String displayName, String birthDate, String level, String guide) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid = auth.currentUser?.uid.toString();
  users.add({
    'displayName': displayName,
    'uid': uid,
    'birt date': birthDate,
    'level': level,
    'guide': guide
  });
  return;
}
