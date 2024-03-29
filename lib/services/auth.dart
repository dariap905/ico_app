import 'package:firebase_auth/firebase_auth.dart';
import 'package:ico_app/services/database.dart';

class AuthService {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> handleSignIn(String email, String password) async {
    UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final User currentUser = (await auth.currentUser)!;
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');

    return user;
  }

  Future<User?> handleSignUp(email, password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User user = result.user!;

      return user;
    } catch(e) {
      return null;
    }
  }
}