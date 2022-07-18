class Validator {
  static String? validateName({required String name}) {
    // if (userName == null) {
    //   return null;
    // }
    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }
    return null;
  }

  static String? validateType({required String type}) {
    // if (type == null) {
    //   return null;
    // }
    if (type.isEmpty) {
      return 'Type is required';
    }
    return null;
  }

}
