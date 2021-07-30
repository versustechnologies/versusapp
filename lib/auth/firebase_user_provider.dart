import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class VersusFirebaseUser {
  VersusFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

VersusFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<VersusFirebaseUser> versusFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<VersusFirebaseUser>((user) => currentUser = VersusFirebaseUser(user));
