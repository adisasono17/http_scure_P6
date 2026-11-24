class Validators {
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  /// Memvalidasi bahwa [value] tidak kosong.
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// Memvalidasi panjang [value] antara [min] dan [max].
  static bool hasValidLength(String value, {int min = 1, int max = 100}) {
    final length = value.trim().length;
    return length >= min && length <= max;
  }

  static String sanitize(String input) {
    return input
        .replaceAll('<', '<')
        .replaceAll('>', '>')
        .replaceAll('"', '"')
        .replaceAll("'", "'")
        .trim();
  }

  static String? validateText(
    String? value, {
    String fieldName = 'Field',
    int minLength = 1,
    int maxLength = 100,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName tidak boleh kosong';
    }
    if (!hasValidLength(value, min: minLength, max: maxLength)) {
      return '$fieldName harus antara $minLength-$maxLength karakter';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!isValidEmail(value.trim())) {
      return 'Format email tidak valid';
    }
    return null;
  }
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    
    final phoneRegex = RegExp(r'^[0-9]{10,13}$');
    
    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Nomor telepon harus berupa angka (10-13 digit)';
    }
    return null;
  }

  static String? validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'URL tidak boleh kosong';
    }

    final urlRegex = RegExp(r'^https?:\/\/.+');
    
    if (!urlRegex.hasMatch(value.trim())) {
      return 'URL harus dimulai dengan http:// atau https://';
    }
    return null;
  }
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    final hasDigits = RegExp(r'[0-9]').hasMatch(value);
    final hasSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

    if (!hasUppercase) {
      return 'Password harus mengandung minimal 1 huruf kapital (A-Z)';
    }
    if (!hasDigits) {
      return 'Password harus mengandung minimal 1 angka (0-9)';
    }
    if (!hasSpecialCharacters) {
      return r'Password harus mengandung minimal 1 simbol (!@#$%^&* dll)';
    }

    return null;
  }
}
