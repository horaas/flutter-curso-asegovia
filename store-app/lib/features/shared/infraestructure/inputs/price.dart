import 'package:formz/formz.dart';

enum PriceError { empty, value }

class Price extends FormzInput<double, PriceError> {

  const Price.pure() : super.pure(0.0);

  const Price.dirty( super.value ) : super.dirty();

  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == PriceError.empty ) return 'El campo es requerido';
    if ( displayError == PriceError.value ) return 'Tiene que ser un número mayor o igual a cero';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PriceError? validator(double value) {
    
    if ( value.toString().isEmpty || value.toString().trim().isEmpty ) return PriceError.empty;
    if ( value < 0 ) return PriceError.value;

    return null;
  }
}