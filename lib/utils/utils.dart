String? uValidator({
  required String value,
  bool isRequired = false,
  bool isEmail = false,
  required int minLength,
}) {
  if (isRequired) {
    if (value.isEmpty) {
      return 'Required';
    }
  }

  if (isEmail) {
    if (!value.contains('@') || !value.contains('.')) {
      return 'Invalid Email';
    }
  }

  if (value.length < minLength) {
    return 'Min $minLength character';
  }

  return null;
}
