String? generiqueValidator(String? value, String? fieldName) {
  if (value == null || value.isEmpty) {
    return "Please enter a $fieldName";
  }
  return null;
}

timeValidator(String? value, String fieldValue) {
  if (value != null) {
    var time = value.split(":");
    if (time.length != 2) {
      return "Please enter a valid $fieldValue";
    }
    if (int.tryParse(time[0])! > 23 || int.tryParse(time[1])! > 59) {
      return "Please enter a valid $fieldValue";
    }
  }
  return null;
}
