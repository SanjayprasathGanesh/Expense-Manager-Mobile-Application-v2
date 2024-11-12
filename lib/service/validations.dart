String? validateUserName(String? name) {
  if (name == null || name.isEmpty) {
    return 'Empty Name Field';
  } else {
    bool hasLetter = false;
    bool hasNumber = false;
    bool hasSpecialChar = false;
    bool hasSpace = false;

    Set<String> specialCharacters = {
      '!',
      '@',
      '#',
      '\$',
      '%',
      '^',
      '&',
      '*',
      '+',
      '-',
      '_',
      '/',
      '?',
      '(',
      ')',
      '|',
      '~',
      '`'
    };

    for (int i = 0; i < name.length; i++) {
      String ch = name[i];

      // Check if the character is a letter
      if (ch.toLowerCase() != ch.toUpperCase()) {
        hasLetter = true;
      }
      // Check if the character is a number
      if ('0123456789'.contains(ch)) {
        hasNumber = true;
      }
      // Check if the character is a special character
      if (specialCharacters.contains(ch)) {
        hasSpecialChar = true;
      }

      if (ch == ' ') {
        hasSpace = true;
      }
    }

    // Check if all required character types are present and the length is at least 6
    print("Space : $hasSpace");
    if (hasLetter &&
        hasNumber &&
        hasSpecialChar &&
        name.length >= 8 &&
        !hasSpace) {
      return null;
    } else {
      return 'Invalid UserName';
    }
  }
}

String? validateUserPassword(String? psw) {
  if (psw == null || psw.isEmpty) {
    return 'Empty Password Field';
  } else {
    String upper = psw.replaceAll(RegExp(r'[^A-Z]'), '');
    String lower = psw.replaceAll(RegExp(r'[^a-z]'), '');
    String num = psw.replaceAll(RegExp(r'[^0-9]'), '');
    String spl = psw.replaceAll(RegExp(r'[A-Za-z0-9]'), '');

    if ((psw.startsWith(RegExp(r'[a-zA-Z]')) ||
            psw.startsWith(RegExp(r'[0-9]'))) &&
        upper.isNotEmpty &&
        lower.isNotEmpty &&
        num.length >= 2 &&
        spl.length == 1 &&
        psw.length >= 8) {
      return null;
    } else {
      return 'Invalid Password';
    }
  }
}

String? validateName(String? name) {
  if (name!.isNotEmpty) {
    String s = name!.replaceAll(RegExp(r'[^A-Za-z ]'), '');
    if (s.length == name.length) {
      return null;
    } else {
      return 'Name must contain Alphabets';
    }
  } else {
    return 'Empty Name field';
  }
}

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email is required';
  } else {
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );

    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
