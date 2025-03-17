import 'package:formz/formz.dart';

// define el enumerado de los errores a validar
enum UserNameError { empty, length }

class Prueba {
  final UserNameError entry;
  Prueba({required this.entry});

  
}

// se define el nombre de la clase para la validacion
class Username extends FormzInput<String, UserNameError> {
  // se llama para la inicializacion de la clase
  const Username.pure() : super.pure('');

  // el provee el valor a evaluar
  const Username.dirty(super.value) : super.dirty();

  // Override validator para menejar la validación del mismo
  @override
  UserNameError? validator(String value) {
    if ( value.isEmpty || value.trim().isEmpty) return UserNameError.empty;
    if (value.length <= 5) return UserNameError.length;

    return null;
  }


  String? get errorMessage {

    if (isValid || isPure) return null;


    switch(displayError){
      case UserNameError.empty:
        return 'gola';
      case UserNameError.length:
        return 'chau';
      default:
        return '';
      }
  }
}