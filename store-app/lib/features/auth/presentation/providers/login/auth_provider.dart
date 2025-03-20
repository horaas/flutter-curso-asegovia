import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();

  return AuthNotifier(authRepository: authRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository}) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(
      authStatus: AuthStatus.checking,
    );

    await Future.delayed(const Duration(milliseconds: 2000));

    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on CustomError catch (e) {
      //manejo de error personalizados para poder controlar
      logout(e.message);
    } catch (e) {
      // error no contraolado por nuestros errores
      logout('Error no controlado');
    }
  }

  void register(String fullName, String email, String password) async {
    try {
      state = state.copyWith(
        authStatus: AuthStatus.checking,
      );

      await Future.delayed(const Duration(milliseconds: 2000));

      final user = await authRepository.register(email, password, fullName);

      state = state.copyWith(
        user: user,
        authStatus: AuthStatus.notAuthenticated,
      );
    } on CustomError catch (e) {
      //manejo de error personalizados para poder controlar
      logout(e.message);
    } catch (e) {
      // error no contraolado por nuestros errores
      logout('Error no controlado');
    }
  }

  void checkAuthStatus() async {}

  void _setLoggedUser(User user) {
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: ''
    );
  }

  Future<void> logout([String? errorMessage]) async {
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.notAuthenticated,
      this.user,
      this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}
