import 'package:formz/formz.dart';

enum SlugError { empty, format }

class Slug extends FormzInput<String, SlugError> {

  const Slug.pure() : super.pure('');

  const Slug.dirty( super.value ) : super.dirty();



  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == SlugError.empty ) return 'El campo es requerido';
    if ( displayError == SlugError.format ) return 'El campo no tiene el formato esperado';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  SlugError? validator(String value) {
    
    if ( value.isEmpty || value.trim().isEmpty ) return SlugError.empty;
    if ( value.contains("'") || value.contains(' ') ) return SlugError.format;

    return null;
  }
}