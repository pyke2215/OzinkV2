import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fooddelivtute/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fooddelivtute/firebase_options.dart';
import 'package:flutter/material.dart';
void main(){
  initApp();
  group('AuthService', () {
    late MockFirebaseAuth mockFirebaseAuth;
    late AuthService authService;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      authService = AuthService();
    });

    test('getCurrentUser returns null if user is not signed in', () {
      expect(authService.getCurrentUser(), isNull);
    });

    test('signInWithEmailAndPassword returns UserCredential when successful', () async {
      final userCredential = await authService.signInWithEmailAndPassword('pyke22154041e@gmail.com', 'pyke22154041e');
      expect(userCredential, isA<UserCredential>());
      expect(userCredential.user, isA<User>());
    });

    test('signInWithEmailAndPassword throws exception when authentication fails', () async {
      expect(() async => await authService.signInWithEmailAndPassword('inva!lidexample.com', 'password'), throwsException);
    });

    test('signUpWithEmailAndPassword returns UserCredential when successful', () async {
      final userCredential = await authService.signUpWithEmailAndPassword('nhocconquaypha789@gmail.com', 'pyke22154041e');
      expect(userCredential, isA<UserCredential>());
      expect(userCredential.user, isA<User>());
    });

    test('signUpWithEmailAndPassword throws exception when email is already in use', () async {
      expect(() async => await authService.signUpWithEmailAndPassword('pyke22154041e@gmail.com', 'pyke22154041e'), throwsException);
    });

    test('signOut does not throw any exception', () async {
      expect(() async => await authService.signOut(), returnsNormally);
    });
  });
}

void initApp() async{
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}