import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void signInUserEmailAndPassword(
    FirebaseAuth auth, String email, String password, String exception) async {
  try {
    var userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    var newUser = userCredential.user;

    if (!newUser!.emailVerified) {
      await newUser.sendEmailVerification();
    }
  } catch (e) {
    exception = e.toString();
  }
}

void logInUserEmailAndPassword(
    FirebaseAuth auth, String email, String password, String exception) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    exception = e.toString();
  }
}

void signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  await FirebaseAuth.instance.signInWithCredential(credential);
}
