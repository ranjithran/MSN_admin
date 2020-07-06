import 'package:admin/Screens/LoginPage.dart';
import 'package:admin/Screens/OtpPage.dart';
import 'package:admin/Screens/UserScreens.dart';
import 'package:admin/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseAuthServices {
  GlobalKey<ScaffoldState> loginScaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String actualCode;
  Future<void> getCodeWithPhoneNumber(String phoneNumber) async {
    print("sending code to $phoneNumber");
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential auth) async {
          await _auth.signInWithCredential(auth).then((AuthResult value) {
            if (value != null && value.user != null) {
              print('Authentication successful');
              // onAuthenticationSuccessful(context, value);
            } else {
              loginScaffoldKey.currentState.showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.red,
                content: Text(
                  'Invalid code/invalid authentication',
                  style: TextStyle(color: Colors.white),
                ),
              ));
            }
          }).catchError((error) {
            loginScaffoldKey.currentState.showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red,
              content: Text(
                'Something has gone wrong, please try later',
                style: TextStyle(color: Colors.white),
              ),
            ));
          });
        },
        verificationFailed: (AuthException authException) {
          print('Error message: ' + authException.message);
          loginScaffoldKey.currentState.showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Text(
              'The phone number format is incorrect. Please enter your number in E.164 format. [+][country code][number]',
              style: TextStyle(color: Colors.white),
            ),
          ));
        },
        codeSent: (String verificationId, [int forceResendingToken]) async {
          actualCode = verificationId;

          await Navigator.of(loginScaffoldKey.currentContext)
              .push(MaterialPageRoute(builder: (_) => const OtpPage()));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          actualCode = verificationId;
        });
  }

  Future<void> validateOtpAndLogin(String smsCode) async {
    final AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: actualCode, smsCode: smsCode);

    await _auth.signInWithCredential(_authCredential).catchError((error) {
      loginScaffoldKey.currentState.showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(
          'Wrong code ! Please enter the last code received.',
          style: TextStyle(color: Colors.white),
        ),
      ));
    }).then((AuthResult authResult) {
      if (authResult != null && authResult.user != null) {
        print(authResult.user.phoneNumber);
        print('Authentication successful');

        Navigator.of(loginScaffoldKey.currentContext).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => UserScreen()),
            (Route<dynamic> route) => false);
        // onAuthenticationSuccessful(context, authResult);
      }
    });
  }
Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const LoginPage()), (Route<dynamic> route) => false);
    
  }
}
