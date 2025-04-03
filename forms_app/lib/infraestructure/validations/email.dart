import 'package:formz/formz.dart';

// define el enumerado de los errores a validar
enum EmailError { empty, format }


// se define el nombre de la clase para la validacion
class Email extends FormzInput<String, EmailError> {
  static final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  // se llama para la inicializacion de la clase
  const Email.pure() : super.pure('');

  // el provee el valor a evaluar
  const Email.dirty(super.value) : super.dirty();

  // Override validator para menejar la validación del mismo
  @override
  EmailError? validator(String value) {
    if ( value.isEmpty || value.trim().isEmpty) return EmailError.empty;
     if (!emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }


  String? get errorMessage {

    if (isValid || isPure) return null;


    switch(displayError){
      case EmailError.empty:
        return 'No puede estar vacio';
      case EmailError.format:
        return 'el correo electronico no es valido';
      default:
        return '';
      }
  }
}