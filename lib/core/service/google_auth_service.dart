import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn;

  GoogleAuthService({GoogleSignIn? googleSignIn})
    : _googleSignIn = googleSignIn ?? GoogleSignIn();

  /// Returns Google Auth ID (googleAuth.id)
  Future<String?> getGoogleAuthId() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();

    if (account == null) {
      // user cancelled sign-in
      return null;
    }

    return account.id;
  }

  /// Optional: silent sign-in (already logged in user)
  Future<String?> getGoogleAuthIdSilently() async {
    final GoogleSignInAccount? account = await _googleSignIn.signInSilently();

    return account?.id;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
