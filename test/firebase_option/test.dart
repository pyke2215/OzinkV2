import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:firebase_core/firebase_core.dart';
import 'package:fooddelivtute/firebase_options.dart';

void main() {
  group('DefaultFirebaseOptions', () {
    test('currentPlatform returns FirebaseOptions for Android', () {
      final options = DefaultFirebaseOptions.currentPlatform;

      expect(options.apiKey, isNotEmpty);
      expect(options.appId, isNotEmpty);
      expect(options.messagingSenderId, isNotEmpty);
      expect(options.projectId, isNotEmpty);
      expect(options.storageBucket, isNotEmpty);
    });

    test('currentPlatform throws UnsupportedError for iOS', () {
      expect(() => DefaultFirebaseOptions.currentPlatform,
          throwsUnsupportedError);
    });

    // Add tests for other platforms like macOS, Windows, and Linux if needed
  });
}
