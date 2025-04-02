import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';

final canCheckBiometricProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometric();
});

enum LocalAuthEnum { authenticate, notauthenticate, authenticating }

class LocalAuthState {
  final String message;
  final LocalAuthEnum status;
  final bool didAuthenticate;

  LocalAuthState({
    this.message = '',
    this.status = LocalAuthEnum.notauthenticate,
    this.didAuthenticate = false,
  });

  LocalAuthState copyWith({
    String? message,
    LocalAuthEnum? status,
    bool? didAuthenticate,
  }) => LocalAuthState(
    message: message ?? this.message,
    status: status ?? this.status,
    didAuthenticate: didAuthenticate ?? this.didAuthenticate,
  );
  @override
  String toString() {
    // TODO: implement toString
    return '''
     $message
     $status
     $didAuthenticate
    ''';
  }
}

class LocalAuthNotifier extends StateNotifier<LocalAuthState> {
  LocalAuthNotifier() : super(LocalAuthState());


  Future<(bool, String)>autenticateUser() async {

    final (didAuthenticate, message) = await LocalAuthPlugin.authenticate();

    state = state.copyWith(
      message: message,
      status: didAuthenticate ? LocalAuthEnum.authenticate : LocalAuthEnum.notauthenticate,
      didAuthenticate: didAuthenticate
    );

    return (didAuthenticate, message);
  }
}

final localAuthProvider =
    StateNotifierProvider<LocalAuthNotifier, LocalAuthState>((ref) {
      return LocalAuthNotifier();
    });
