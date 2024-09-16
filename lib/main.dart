import 'package:fizmat_app/models/theme.dart';
import 'package:fizmat_app/screens/birthday/birthday.dart';
import 'package:fizmat_app/screens/home/home.dart';
import 'package:fizmat_app/screens/login/login.dart';
import 'package:fizmat_app/screens/profile/profile.dart';
import 'package:fizmat_app/screens/timetb/timetb.dart';
import 'package:fizmat_app/widgets/fiz_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FizTheme().buildTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => FizLogin(),
        '/FizNavBar': (context) => FizNavBar(
              pages: const [
                FizHome(),
                FizTimetb(),
                FizBirthday(),
                FizProfile(),
              ],
            ),
        '/FizHome': (context) => FizHome(),
        '/FizTimetb': (context) => FizTimetb(),
        '/FizBirthday': (context) => FizBirthday(),
        '/FizProfile': (context) => FizProfile(),
      },
    );
  }
}

