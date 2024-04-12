import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/services/auth/auth_service.dart';
import 'package:mockito/mockito.dart';
import 'package:fooddelivtute/firebase_options.dart';
import 'package:flutter/src/widgets/binding.dart';
import 'package:firebase_core/firebase_core.dart';
class MockUserCredential extends Mock implements UserCredential {}
void main() {
  late AuthService authService;
  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    mockFirebaseAuth = MockFirebaseAuth();
    authService = AuthService();
  });

  group('AuthService', () {
    test('should throw an exception when sign in fails', () async {
      // given
      const String email = 'tes%!t@email.com';
      const String password = 'testpassword';
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: email, password: password)).thenThrow(FirebaseAuthException(code: 'unknown'));

      // when
      try {
        await authService.signInWithEmailAndPassword(email, password);
      }
      // then
      catch (e) {
        expect(e, isA<Exception>());
        expect((e as Exception).toString(), equals('unknown'));
      }
    });
    
    test('should sign in with email and password successfully', () async {
      // given
      
      const String email = 'pyke22154041e@gmail.com';
      const String password = 'fullhose159';
      final UserCredential userCredential = MockUserCredential();
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: email, password: password)).thenAnswer((_) async => userCredential);

      // when
      final result = await authService.signInWithEmailAndPassword(email, password);

      // then
      expect(result, equals(userCredential));
      verify(mockFirebaseAuth.signInWithEmailAndPassword(email: email, password: password)).called(1);
    });
  });
}