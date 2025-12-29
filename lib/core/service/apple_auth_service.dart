import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthService {
  /// Returns Apple Auth ID (userIdentifier)
  Future<String?> getAppleAuthId() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // ✅ THIS IS THE APPLE AUTH ID
      return credential.userIdentifier;
    } catch (e) {
      rethrow;
    }
  }
}
