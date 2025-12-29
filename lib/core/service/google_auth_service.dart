import 'package:google_sign_in/google_sign_in.dart';
import 'package:meditation_app/core/model/google_user_model.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn;

  GoogleAuthService({GoogleSignIn? googleSignIn})
    : _googleSignIn = googleSignIn ?? GoogleSignIn();

  /// Sign in and return Google user details
  Future<GoogleUserModel?> signIn() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();

    if (account == null) {
      // user cancelled sign-in
      return null;
    }

    return GoogleUserModel(
      id: account.id,
      name: account.displayName ?? '',
      email: account.email,
      profileImage: account.photoUrl,
    );
  }

  /// Silent sign-in (already logged in user)
  Future<GoogleUserModel?> signInSilently() async {
    final GoogleSignInAccount? account = await _googleSignIn.signInSilently();

    if (account == null) return null;

    return GoogleUserModel(
      id: account.id,
      name: account.displayName ?? '',
      email: account.email,
      profileImage: account.photoUrl,
    );
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
