import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static availableBiometri() async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  static Future<bool> canCheckBiometric() async {
    return await auth.canCheckBiometrics;
  }


  static Future<(bool, String)> authenticate([biometricOnly = true]) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'conatinua autenticate',
        options: AuthenticationOptions(useErrorDialogs: false, biometricOnly: biometricOnly),
      );
      return (didAuthenticate, didAuthenticate ? 'success' : 'cancelado usuario');
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        return (false, 'no valido');
      } else if (e.code == auth_error.notEnrolled) {
        return (false, 'huella no configurada');
      } else if (e.code == auth_error.lockedOut) {
        return (false, 'huella bloqueada temporalmente');
      } else if (e.code == auth_error.passcodeNotSet) {
        return (false, 'no hay pass');
      }  else if (e.code == auth_error.permanentlyLockedOut) {
        return (false, 'no hay desbloquear');
      } else {
        return (false, 'no encontrado');
      }
    }
  }
}
