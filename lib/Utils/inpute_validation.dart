validateName(String value) {
  // String pattern = r'^[a-z A-Z]+$';
  // RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please add name';
  } else if (value.length < 3) {
    return 'Name add at least 3 character';
  } else {
    return null;
  }
}

validateSubject(String value) {
  // String pattern = r'^[a-z A-Z]+$';
  // RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please add subject';
  } /*else if (value.length < 3) {
    return 'Name add at least 3 character';
  }*/
  else {
    return null;
  }
}

validateDec(String value) {
  // String pattern = r'^[a-z A-Z]+$';
  // RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please add comment';
  } else if (value.length < 3) {
    return 'Comment add at least 3 character';
  } else {
    return null;
  }
}

validateMsg(String value) {
  // String pattern = r'^[a-z A-Z]+$';
  // RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please add message';
  } else if (value.length < 3) {
    return 'Comment add at least 3 message';
  } else {
    return null;
  }
}

validateEmail(String value) {
  bool validEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (value.isEmpty) {
    return 'Please add email';
  } else if (validEmail) {
    return null;
  } else {
    return 'Invalid email address';
  }
}
