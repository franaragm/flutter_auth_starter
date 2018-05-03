import '../../../../validators/validator.dart';
import '../../../../validators/passwordValidator.dart' as passwordValidator;

import '../../../../common/appException.dart';

class ViewModel {
  ViewModel() {
    _validator = new Validator();
    _validator.validations.add(() => validatePassword(password));
  }

  String password = '';

  Validator _validator;

  String validatePassword(String value) => passwordValidator.validate(value);

  void validateAll() {
    var errors = _validator.validate();
    if (errors != null && errors.length > 0) {
      throw new AppException(errors);
    }
  }
}