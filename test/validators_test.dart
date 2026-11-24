import 'package:flutter_test/flutter_test.dart';
import 'package:rpl_keamanan/utils/validators.dart'; 

void main() {
  group('Validators Unit Test', () {
    group('validatePhone', () {
      test('mengembalikan null jika nomor telepon valid (10-13 digit angka)', () {
        expect(Validators.validatePhone('081234567890'), isNull);
        expect(Validators.validatePhone('0812345678'), isNull);
        expect(Validators.validatePhone('0812345678901'), isNull);
      });

      test('mengembalikan pesan error jika kosong atau null', () {
        expect(Validators.validatePhone(''), isNotNull);
        expect(Validators.validatePhone(null), isNotNull);
      });

      test('mengembalikan pesan error jika mengandung huruf atau simbol', () {
        expect(Validators.validatePhone('0812345abcde'), isNotNull);
        expect(Validators.validatePhone('+628123456789'), isNotNull);
      });

      test('mengembalikan pesan error jika kurang dari 10 digit atau lebih dari 13 digit', () {
        expect(Validators.validatePhone('081234567'), isNotNull); // 9 digit
        expect(Validators.validatePhone('08123456789012'), isNotNull); // 14 digit
      });
    });

    group('validateUrl', () {
      test('mengembalikan null jika URL dimulai dengan http:// atau https://', () {
        expect(Validators.validateUrl('https://amikom.ac.id'), isNull);
        expect(Validators.validateUrl('http://example.com'), isNull);
      });

      test('mengembalikan pesan error jika kosong atau null', () {
        expect(Validators.validateUrl(''), isNotNull);
        expect(Validators.validateUrl(null), isNotNull);
      });

      test('mengembalikan pesan error jika tidak memiliki protokol http:// atau https://', () {
        expect(Validators.validateUrl('amikom.ac.id'), isNotNull);
        expect(Validators.validateUrl('www.google.com'), isNotNull);
        expect(Validators.validateUrl('ftp://files.example.com'), isNotNull);
      });
    });

    group('validatePassword', () {
      test('mengembalikan null jika password memenuhi semua syarat keamanan', () {
        expect(Validators.validatePassword('Amikom2026!'), isNull);
        expect(Validators.validatePassword('P@ssw0rdKu'), isNull);
      });

      test('mengembalikan pesan error jika password kosong atau kurang dari 8 karakter', () {
        expect(Validators.validatePassword(''), isNotNull);
        expect(Validators.validatePassword(null), isNotNull);
        expect(Validators.validatePassword('Ab1!'), isNotNull);
      });

      test('mengembalikan pesan error jika tidak mengandung huruf kapital', () {
        expect(Validators.validatePassword('amikom2026!'), isNotNull);
      });

      test('mengembalikan pesan error jika tidak mengandung angka', () {
        expect(Validators.validatePassword('AmikomJogja!'), isNotNull);
      });

      test('mengembalikan pesan error jika tidak mengandung simbol khusus', () {
        expect(Validators.validatePassword('Amikom2026'), isNotNull);
      });
    });
  });
}