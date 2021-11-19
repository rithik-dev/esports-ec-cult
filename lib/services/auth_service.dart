import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  const AuthService._();

  static final _auth = FirebaseAuth.instance;

  static bool get isLoggedIn => _auth.currentUser != null;

  static User? get firebaseUser => _auth.currentUser;

  static Future<String?> authWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final _userCred = await _auth.signInWithCredential(credential);
      return _userCred.user?.uid;
    } catch (_) {}
  }

  static Future<String?> registerUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    final userCredentials = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredentials.user?.uid;
  }

  static Future<String?> loginUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    final userCredentials = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredentials.user?.uid;
  }

  static Future<void> signOut() => _auth.signOut();
}
