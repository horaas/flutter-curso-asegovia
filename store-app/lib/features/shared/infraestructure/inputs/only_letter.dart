import 'package:formz/formz.dart';

// Define input validation errors
enum OnlyLetterError { empty, format }

// Extend FormzInput and provide the input type and error type.
class OnlyLetter extends FormzInput<String, OnlyLetterError> {

  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z Nñ]+$',
  );

  // Call super.pure to represent an unmodified form input.
  const OnlyLetter.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const OnlyLetter.dirty( String value ) : super.dirty(value);



  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == OnlyLetterError.empty ) return 'El campo es requerido';
    if ( displayError == OnlyLetterError.format ) return 'Solo se aceptan letras';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  OnlyLetterError? validator(String value) {
    
    if ( value.isEmpty || value.trim().isEmpty ) return OnlyLetterError.empty;
    if ( !emailRegExp.hasMatch(value) ) return OnlyLetterError.format;

    return null;
  }
}