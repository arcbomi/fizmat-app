import 'package:firebase_auth/firebase_auth.dart';
import 'package:fizmat_app/models/login.dart';
import 'package:fizmat_app/screens/login/local_widgets/background_animation.dart';
import 'package:fizmat_app/screens/login/local_widgets/login_form.dart';
import 'package:fizmat_app/screens/login/local_widgets/showing_text.dart';
import 'package:fizmat_app/screens/login/local_widgets/type_writer.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class FizLogin extends StatelessWidget {
  const FizLogin({super.key});

  @override
  Widget build(BuildContext context) {
    const config = FizLoginInfo.getFizLoginConfig;

    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    Future<UserCredential> signInWithGoogle() async {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);

      // Or use signInWithRedirect
      // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
    }

    return Scaffold(
      body: Stack(
        children: [
          MovingWidget(), // Your background widget
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FizLoginHeadText(
                  text: "Fizmat App",
                  size: 60,
                ),
                SizedBox(height: 50.0),
                FizLoginShowingText(
                  text: 'Log into your\n @fizmat.kz account to',
                ),
                SizedBox(height: 20.0),
                FizTypeWriterScreen(
                  texts: const ['Discover', 'Share', 'Vote', 'Communicate'],
                ),
                SizedBox(height: 100.0),
                FizLoginButton(
                  onPressed: () async{
                    await signInWithGoogle();
                  },
                ),
                SizedBox(height: 10.0),
                FizGuestLogin(
                  routeName: "/FizNavBar",
                  text: 'Login as Guest',
                ),
                SizedBox(height: 20.0),
                FizAgreeTerms(
                  text: "Agree to fizmat-app's unfair terms.",
                  termsUrl: "https://arcbomi.github.io/a.html",
                  initAgree: config.isAgreeFizTerms,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
