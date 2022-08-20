import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements firebase_auth.FirebaseAuth {}

class MockUserCredential extends Mock implements firebase_auth.UserCredential {}

class FakeAuthCredential extends Fake implements firebase_auth.AuthCredential {}

void main() {
  group('AuthenticationRepository', () {
    late firebase_auth.FirebaseAuth firebaseAuth;
    late AuthenticationRepository authenticationRepository;

    setUpAll(() {
      registerFallbackValue(FakeAuthCredential());
    });

    setUp(() {
      firebaseAuth = MockFirebaseAuth();

      authenticationRepository = AuthenticationRepository(
        firebaseAuth: firebaseAuth,
      );
    });

    group('signInWithEmailAndPassword', () {
      setUp(() {
        when(
          () =>
              firebaseAuth.signInWithEmailAndPassword(email: '', password: ''),
        ).thenAnswer((_) => Future.value(MockUserCredential()));
      });

      test('calls signInWithEmailAndPassword', () async {
        await authenticationRepository.signInWithEmailAndPassword('', '');
        verify(
          () =>
              firebaseAuth.signInWithEmailAndPassword(email: '', password: ''),
        ).called(1);
      });

      test('succeeds when signInWithEmailAndPassword succeeds', () async {
        expect(
          authenticationRepository.signInWithEmailAndPassword('', ''),
          completes,
        );
      });

      test(
          'throws SignInWithEmailAndPasswordException '
          'when signInWithEmailAndPassword throws', () async {
        when(
          () =>
              firebaseAuth.signInWithEmailAndPassword(email: '', password: ''),
        ).thenThrow(
            firebase_auth.FirebaseAuthException(code: 'wrong-password'));
        expect(
          authenticationRepository.signInWithEmailAndPassword('', ''),
          throwsA(
            isA<AuthException>(),
          ),
        );
      });
    });

    group('signOut', () {
      setUp(() {
        when(
          () => firebaseAuth.signOut(),
        ).thenAnswer((_) => Future.value(null));
      });

      test('calls signOut', () async {
        await authenticationRepository.signOut();
        verify(
          () => firebaseAuth.signOut(),
        ).called(1);
      });

      test(
          'throws SignOutException '
          'when signOut throws', () async {
        when(
          () => firebaseAuth.signOut(),
        ).thenThrow(Exception());
        expect(
          authenticationRepository.signOut(),
          throwsA(isA<UserException>()),
        );
      });
    });

    group('resgisterUser', () {
      setUp(() {
        when(
          () => firebaseAuth.createUserWithEmailAndPassword(
            email: 'a',
            password: 'a',
          ),
        ).thenAnswer((_) => Future.value(MockUserCredential()));
        when(
          () => firebaseAuth.signInWithEmailAndPassword(
            email: 'a',
            password: 'a',
          ),
        ).thenAnswer((_) => Future.value(MockUserCredential()));
      });

      test(
          'calls createUserWithEmailAndPassword and signInWithEmailAndPassword',
          () async {
        await authenticationRepository.registerUserWithEmailAndPassowrd(
            'a', 'a');
        verify(() => firebaseAuth.createUserWithEmailAndPassword(
            email: 'a', password: 'a')).called(1);
        verify(() => firebaseAuth.signInWithEmailAndPassword(
            email: 'a', password: 'a')).called(1);
      });

      test(
          'throws AuthException '
          'when signInWithEmailAndPassword throws', () async {
        when(
          () =>
              firebaseAuth.signInWithEmailAndPassword(email: '', password: ''),
        ).thenThrow(
            firebase_auth.FirebaseAuthException(code: 'wrong-password'));
        expect(
          authenticationRepository.registerUserWithEmailAndPassowrd('', ''),
          throwsA(
            isA<AuthException>(),
          ),
        );
      });

      test(
          'throws AuthException '
          'when createUserWithEmailAndPassword throws', () async {
        when(
          () => firebaseAuth.createUserWithEmailAndPassword(
              email: 'a', password: 'a'),
        ).thenThrow(
            firebase_auth.FirebaseAuthException(code: 'wrong-password'));
        expect(
          authenticationRepository.registerUserWithEmailAndPassowrd('', ''),
          throwsA(
            isA<AuthException>(),
          ),
        );
      });
    });

    group('forgotPassword', () {
      setUp(() {
        when(
          () => firebaseAuth.sendPasswordResetEmail(email: 'email'),
        ).thenAnswer((_) => Future.value(null));
      });

      test('calls sendPasswordResetEmail', () async {
        await authenticationRepository.forgotPassword('email');
        verify(() => firebaseAuth.sendPasswordResetEmail(email: 'email'))
            .called(1);
      });

      test(
          'throws AuthException'
          'when sendPasswordResetEmail throws', () async {
        when(
          () => firebaseAuth.sendPasswordResetEmail(email: 'email'),
        ).thenThrow(firebase_auth.FirebaseAuthException(code: 'invalid-user'));
        expect(
          authenticationRepository.forgotPassword('email'),
          throwsA(
            isA<AuthException>(),
          ),
        );
      });
    });
  });
}
