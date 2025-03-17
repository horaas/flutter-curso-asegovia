import 'package:formz/formz.dart';

// define el enumerado de los errores a validar
enum PasswordError { empty, length }

// se define el nombre de la clase para la validacion
class Password extends FormzInput<String, PasswordError> {
  // se llama para la inicializacion de la clase
  const Password.pure() : super.pure('');

  // el provee el valor a evaluar
  const Password.dirty(super.value) : super.dirty();

  // Override validator para menejar la validación del mismo
  @override
  PasswordError? validator(String value) {
    if ( value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length <= 5) return PasswordError.length;

    return null;
  }
}