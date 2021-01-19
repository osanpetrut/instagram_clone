import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:instagram_clone/src/models/index.dart';

class AuthApi {
  const AuthApi({@required FirebaseAuth auth, @required FirebaseFirestore firestore})
      : assert(auth != null),
        assert(firestore != null),
        _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<AppUser> login({@required String email, @required String password}) async {
    final UserCredential response = await _auth.signInWithEmailAndPassword(email: email, password: password);

    final User user = response.user;
    final DocumentSnapshot snapShot = await _firestore.doc('users/${user.uid}').get();

    return AppUser.fromJson(snapShot.data());
  }
}
