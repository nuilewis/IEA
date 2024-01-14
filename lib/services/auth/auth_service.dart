import '../../models/auth_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  Future<UserCredential> signInWithEmail(
      {required SignInParameters parameters}) async {
    final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
            email: parameters.email, password: parameters.password);

    return userCredential;
  }

  Future<UserCredential> signInWithGoogle() async {
    //Gets the currently signed in google user;
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    //creates a google account on Firebase
    GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

    //Gets the auth credentials from the google user
    final GoogleAuthCredential googleAuthCredential =
        GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken) as GoogleAuthCredential;

    //Creates an account on Firebase using those auth credentials;
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(googleAuthCredential);

    return userCredential;
  }

  Future<UserCredential> registerWithEmail(
      {required RegisterParameters parameters}) async {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
            email: parameters.email, password: parameters.password);

    return userCredential;
  }

  Future<void> updateAccountInfo() async {}

  Future<void> deleteAccount(User user) async {
    await user.delete();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  ///Get Stream of User Auth State
  ///
  Stream<User?> getAuthStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}
