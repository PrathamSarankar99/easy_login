import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static Stream<User?> authStream() {
    return FirebaseAuth.instance.userChanges();
  }

  static User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  static Future<User?> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? account = await googleSignIn.signIn();
    GoogleSignInAuthentication authentication = await account!.authentication;
    OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: authentication.accessToken,
      idToken: authentication.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  static Future<User?> signInAnonymously() async {
    UserCredential credential = await FirebaseAuth.instance.signInAnonymously();
    return credential.user;
  }

  static Future<bool> signOut() async {
    await GoogleSignIn().signOut();
    // await FacebookLogin().logOut();
    await FirebaseAuth.instance.signOut();
    return true;
  }
}
