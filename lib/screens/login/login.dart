import 'package:fizmat_app/models/login.dart';
import 'package:fizmat_app/screens/login/local_widgets/background_animation.dart';
import 'package:fizmat_app/screens/login/local_widgets/login_form.dart';
import 'package:fizmat_app/screens/login/local_widgets/showing_text.dart';
import 'package:fizmat_app/screens/login/local_widgets/type_writer.dart';
import 'package:flutter/material.dart';

class FizLogin extends StatelessWidget {
  const FizLogin({super.key});

  @override
  Widget build(BuildContext context) {
    const config = FizLoginInfo.getFizLoginConfig;

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
                  onPressed: () {
                    
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
                  termsUrl: "https://arcbomi.github.io/fizmat/app/unfair-terms/",
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
